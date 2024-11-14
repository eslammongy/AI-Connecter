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
        height: 50,
        textEditingController: questionController,
        focusColor: theme.appColors.surface,
        fieldRoundedRadius: BorderRadius.circular(20),
        hint: "ask me anything or something...",
        prefix: SizedBox(
          width: 90,
          child: Row(
            children: [
              _buildPickIngBtn(
                theme,
                icon: Icons.file_present_rounded,
                onPressed: () async {},
              ),
              _buildPickIngBtn(
                theme,
                onPressed: () async {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPickIngBtn(
    ThemeData theme, {
    Function()? onPressed,
    IconData icon = Icons.camera_alt_rounded,
  }) {
    return Card(
      color: theme.appColors.primary,
      margin: EdgeInsets.only(left: 8, top: 0, bottom: 0),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
         padding: const EdgeInsets.all(6.0),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
