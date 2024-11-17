import 'package:ai_connect/features/chatting/presentation/views/widgets/custom_appbar.dart';
import 'package:ai_connect/features/chatting/presentation/views/widgets/questions_history_list.dart';
import 'package:flutter/material.dart';

class ChatHistoryScreen extends StatelessWidget {
  const ChatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(index: 1),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: QuestionsHistoryList(),
      ),
    );
  }
}
