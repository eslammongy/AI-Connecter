import 'package:ai_connect/features/chatting/domain/entities/chat_entity.dart';
import 'package:ai_connect/features/chatting/presentation/views/widgets/question_history_listitem.dart';
import 'package:flutter/material.dart';

class ArchivedQuestionsScreen extends StatelessWidget {
  const ArchivedQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemExtent: 150,
              itemBuilder: (context, index) {
                return QuestionHistoryListItem(
                  isArchived: true,
                  chat: ChatEntity(),
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
