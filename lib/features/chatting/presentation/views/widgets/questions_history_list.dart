import 'package:ai_connect/features/chatting/domain/entities/chat_entity.dart';
import 'package:flutter/material.dart';

import 'question_history_listitem.dart';

class QuestionsHistoryList extends StatelessWidget {
  const QuestionsHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemExtent: 150,
        itemBuilder: (context, index) {
          return QuestionHistoryListItem(
            chat: ChatEntity(),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
