import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:uuid/uuid.dart';

class ChatUI extends StatefulWidget {
  const ChatUI({super.key});

  @override
  State<ChatUI> createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> {
  List<types.Message> _messages = [];
  final types.User _user = types.User(
    id: FirebaseAuth.instance.currentUser!.uid,
    firstName: FirebaseAuth.instance.currentUser!.displayName,
  );
  @override
  void initState() {
    super.initState();
    // _loadInitialMessages();
  }

  void _loadInitialMessages() {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: '',
    );

    setState(() {
      _messages.insert(0, textMessage);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    setState(() {
      _messages.insert(0, textMessage);
    });
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
