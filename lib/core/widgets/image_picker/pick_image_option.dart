import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class PickImageOption extends StatelessWidget {
  const PickImageOption({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });
  final String title;
  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Card(
              color: theme.appColors.primary,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  icon,
                  size: 50,
                ),
              ),
            ),
            Text(
              title,
              style: AppTextStyles.styleMedium20(context),
            )
          ],
        ),
      ),
    );
  }
}
