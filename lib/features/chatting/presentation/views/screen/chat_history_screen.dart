import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/features/chatting/presentation/views/widgets/custom_appbar.dart';
import 'package:ai_connect/features/chatting/presentation/views/widgets/questions_history_list.dart';
import 'package:flutter/material.dart';

class ChatHistoryScreen extends StatelessWidget {
  const ChatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      appBar: CustomAppbar(index: 1),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.appColors.surface,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: QuestionsHistoryList(),
          ),
        ),
      ),
    );
  }
}
