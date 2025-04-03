import 'dart:ui';

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
            Color(0xff1f005c),
            Color(0xff5b0060),
            Color(0xff870160),
            Color(0xffac255e),
            Color(0xffca485c),
            Color(0xffe16b5c),
            Color(0xfff39060),
            Color(0xffffb56b), // Dark Teal
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
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Center(
            child: Text('Chat UI goes here'),
          ),
        ),
      ),
    );
  }
}
