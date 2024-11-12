import 'package:ai_connect/features/home/presentation/views/widgets/question_history_listitem.dart';
import 'package:flutter/material.dart';

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
          return QuestionHistoryListItem();
        },
        itemCount: 10,
      ),
    );
  }
}
