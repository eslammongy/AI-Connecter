import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/utils/helper.dart';
import 'package:ai_connect/core/widgets/expandable_text.dart';
import 'package:ai_connect/features/chatting/domain/entities/message_entity.dart';
import 'package:flutter/material.dart';

class MsgQuestionBubble extends StatelessWidget {
  const MsgQuestionBubble({
    super.key,
    required this.msgEntity,
  });
  final MessageEntity msgEntity;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dateTimeFormatter(msgEntity.dateTime ?? DateTime.now()),
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: theme.appColors.tertiary,),
          ),
        ),
        Row(
          mainAxisAlignment:
              msgEntity.isAnswer ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment:  msgEntity.isAnswer  ? Alignment.topRight : Alignment.topLeft,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 260,
                  minWidth: 100,
                ),
                child: Card(
                  color: theme.appColors.surface,
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExpendableTextWidget(
                      expendedText:msgEntity.text ?? "",
                      textColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
