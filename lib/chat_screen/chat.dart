import 'package:chat_gpt_app/chat_screen/layout/body.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat Gpt",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: const SafeArea(
        child: ChatViewBody(),
      ),
    );
  }
}
