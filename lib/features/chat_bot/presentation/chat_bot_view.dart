import 'package:articulate/constant.dart';
import 'package:articulate/features/chat_bot/presentation/chat_bot_view._body.dart';
import 'package:flutter/material.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'English Chatbot',
          style: TextStyle(color: kWhiteColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: const SafeArea(
        child: ChatBotViewBody(),
      ),
    );
  }
}
