import 'dart:ui';

import 'package:book_hive/features/chat_ui/chat_ui.dart';
import 'package:flutter/material.dart';

class ChatPopupWidget extends StatefulWidget {
  const ChatPopupWidget({super.key, this.chatOpen = false});
  final bool chatOpen;

  @override
  State<ChatPopupWidget> createState() => _ChatPopupWidgetState();
}

class _ChatPopupWidgetState extends State<ChatPopupWidget> {
  bool _chatOpen = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chatOpen = widget.chatOpen;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      margin: EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment(0.8, 1),
          colors: [
            Color(0xff463e4e),
            Color(0xff443647),
            Color(0xff45323f),
            Color(0xff3c2b33),
            Color(0xff302122),
            Color(0xff352423),
            Color(0xff322622),
            Color(0xff302923), // Dark Teal
          ],
          tileMode: TileMode.mirror, // Controls how colors are distributed
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(40)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: ChatUI(),
        ),
      ),
    );
  }
}
