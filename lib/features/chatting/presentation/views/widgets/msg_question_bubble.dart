import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/utils/helper.dart';
import 'package:ai_connect/core/widgets/expandable_text.dart';
import 'package:flutter/material.dart';


class MsgQuestionBubble extends StatelessWidget {
  const MsgQuestionBubble({
    super.key,
   
  });

  @override
  Widget build(BuildContext context) {
    final bool isARobot = true;
    final theme =context.theme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            datetimeFormater(DateTime.now()),
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: theme.colorScheme.surfaceTint),
          ),
        ),
        Row(
          mainAxisAlignment: isARobot
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            Align(
              alignment: isARobot
                  ? Alignment.topRight
                  : Alignment.topLeft,
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
          expendedText: "sample of question text..",
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
