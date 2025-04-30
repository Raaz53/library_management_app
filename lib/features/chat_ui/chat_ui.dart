import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_gemini/flutter_gemini.dart' as gemini;
import 'package:uuid/uuid.dart';

import '../../core/models/saved_book_model/saved_book_model.dart';

class ChatUI extends StatefulWidget {
  const ChatUI({super.key, this.books});
  final List<FireBookModel>? books;

  @override
  State<ChatUI> createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> {
  List<types.Message> _messages = [];
  late String initialPrompt = '';
  final geminiChat = gemini.Gemini.instance;
  final types.User _user = types.User(
    id: FirebaseAuth.instance.currentUser!.uid,
    firstName: FirebaseAuth.instance.currentUser!.displayName,
  );

  @override
  void initState() {
    super.initState();
    _sendInitialPrompt(widget.books ?? []);
    // _loadInitialMessages();
  }

  void _sendInitialPrompt(List<FireBookModel> books) async {
    final booksJson = books.map((book) => book.toJson()).toList();
    initialPrompt = '''
    You are an AI chatbot for the app called Book Hive, a library management system. The list of books is attached in JSON format. Analyze the JSON and respond accordingly within those boundaries. This is the initial text prompt written by the developer. The queries and prompts after this are written by the user. Start the conversation by greeting: "Hi! I am HiveChat. How may I help you today?"
Books JSON: $booksJson
''';

    try {
      final result =
          await geminiChat.prompt(parts: [gemini.Part.text(initialPrompt)]);

      final responseText = result?.output ?? 'Hi! how you doing';

      final aiMessage = types.TextMessage(
        author: types.User(id: 'ai'),
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: Uuid().v4(),
        text: responseText,
      );
      setState(() {
        _messages.insert(0, aiMessage);
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error sending initial prompt: $e');
      }
    }

    // final response = await _chatSession.sendMessage(
    //  Content.text(initialPrompt)
    // );
    //
  }

  // void _loadInitialMessages() {
  //   final textMessage = types.TextMessage(
  //     author: _user,
  //     createdAt: DateTime.now().millisecondsSinceEpoch,
  //     id: const Uuid().v4(),
  //     text: '',
  //   );
  //
  //   setState(() {
  //     _messages.insert(0, textMessage);
  //   });
  // }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    setState(() {
      _messages.insert(0, textMessage);
    });

    try {
      final response =
          await geminiChat.prompt(parts: [gemini.Part.text(message.text)]);

      final responseText =
          response?.output ?? "Sorry, I couldn't understand that.";

      final aiMessage = types.TextMessage(
        author: const types.User(id: 'ai'),
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: responseText,
      );

      setState(() {
        _messages.insert(0, aiMessage);
      });
    } catch (e) {
      if (kDebugMode) {
        print("Gemini API error: $e");
      }

      final errorMessage = types.TextMessage(
        author: const types.User(id: 'ai'),
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: "Oops, there was an error processing your message.",
      );

      setState(() {
        _messages.insert(0, errorMessage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Chat(
      messages: _messages,
      showUserAvatars: true,
      showUserNames: true,
      theme: DefaultChatTheme(
        backgroundColor: Colors.transparent,
        inputBorderRadius: BorderRadius.circular(0),
        messageInsetsHorizontal: 10,
        messageInsetsVertical: 8,
      ),
      onSendPressed: _handleSendPressed,
      user: _user,
    );
  }
}
