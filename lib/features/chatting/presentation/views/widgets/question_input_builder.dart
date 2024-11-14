import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'custom_text_input_filed.dart';

class QuestionInputBuilder extends StatelessWidget {
  const QuestionInputBuilder({super.key, required this.questionController});
  final TextEditingController questionController;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Expanded(
      child: CustomTextInputField(
        textEditingController: questionController,
        focusColor: theme.appColors.surface,
        fieldRoundedRadius: BorderRadius.circular(20),
        hint: "ask me anything or something...",
        prefix: _buildPickIngBtn(
          theme,
          onPressed: () async {
           
          },
        ),
        
      ),
    );
  }

  IconButton _buildPickIngBtn(ThemeData theme,
      {Function()? onPressed, IconData icon = Icons.camera_alt_rounded}) {
    return IconButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      icon: Card(
        color: theme.appColors.primary,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
