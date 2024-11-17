import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/widgets/expandable_text.dart';
import 'package:ai_connect/features/chatting/domain/entities/answer_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MsgQuestionBubble extends StatelessWidget {
  const MsgQuestionBubble({
    super.key,
    required this.msgEntity,
  });

  final AnswerEntity msgEntity;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Align(
      alignment: msgEntity.isAnswer ? Alignment.topRight : Alignment.topLeft,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 280,
          minWidth: 100,
        ),
        child: Card(
          margin: const EdgeInsets.only(bottom: 15),
          color: theme.appColors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: msgEntity.isAnswer
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (msgEntity.hasFile && msgEntity.filePath != null)
                  SvgPicture.asset(
                    msgEntity.filePath!,
                    width: 240,
                  ),
                ExpendableTextWidget(
                  expendedText: msgEntity.text ?? "",
                  textColor: context.theme.appColors.onSurface,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
