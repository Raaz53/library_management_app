import 'package:book_hive/core/utilities/constants.dart';
import 'package:book_hive/core/utilities/utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:uuid/uuid.dart';

import '../../core/models/saved_book_model/saved_book_model.dart';

class ChatUI extends StatefulWidget {
  const ChatUI({super.key, this.books});
  final List<FireBookModel>? books;

  @override
  State<ChatUI> createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> {
  final _inputController = TextEditingController();
  late final ChatSession _session;
  final GenerativeModel _model = GenerativeModel(
      model: 'gemini-2.0-flash', apiKey: GoogleCredentials.apiKey);
  bool _loading = false;

  List<types.Message> _messages = [];
  late String initialPrompt = '';
  final types.User _user = types.User(
    id: FirebaseAuth.instance.currentUser!.uid,
    firstName: FirebaseAuth.instance.currentUser!.displayName,
  );

  @override
  void initState() {
    super.initState();
    _session = _model.startChat();
    _sendInitialPrompt(widget.books ?? []);
    // _loadInitialMessages();
  }

  _showError(String message) {
    if (context.mounted) {
      Utilities.showSnackBar(context, message);
    }
  }

  void _sendInitialPrompt(List<FireBookModel> books) async {
    final booksJson = books.map((book) => book.toJson()).toList();
    initialPrompt = '''
    You are an AI chatbot for the app called Book Hive, a library management system. The list of books is attached in JSON format. Analyze the JSON and respond accordingly within those boundaries. This is the initial text prompt written by the developer. The queries and prompts after this are written by the user. Start the conversation by greeting: "Hi! I am HiveChat. How may I help you today?"
Books JSON: $booksJson
''';
    try {
      final response = await _session.sendMessage(Content.text(initialPrompt));
      var text = response.text;
      if (text == null) {
        text = 'Sorry, I could not understand that.';
      } else {
        _loading = true;
      }
      final aiMessage = types.TextMessage(
        author: const types.User(id: 'ai'),
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: text,
      );
      setState(() {
        _messages.insert(0, aiMessage);
      });
    } catch (e) {
      _showError(e.toString());
      setState(() {
        _loading = false;
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    setState(() {
      _messages.insert(0, textMessage);
      _loading = true;
    });
    try {
      final response = await _session.sendMessage(Content.text(message.text));
      var text = response.text;
      if (text == null) {
        text = 'Sorry, I could not understand that.';
      } else {
        _loading = true;
      }
      final aiMessage = types.TextMessage(
        author: const types.User(id: 'ai'),
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: text,
      );
      setState(() {
        _messages.insert(0, aiMessage);
      });
    } catch (e) {
      _showError(e.toString());
      setState(() {
        _loading = false;
      });
    } finally {
      _inputController.clear();
      setState(() {
        _loading = false;
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
