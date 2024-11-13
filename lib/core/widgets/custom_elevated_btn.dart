import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class CustomElevatedBtn extends StatelessWidget {
  const CustomElevatedBtn({
    super.key,
    this.onPressed,
    required this.text,
    this.bkColor,
    this.icon = Icons.arrow_forward,
  });
  final Function()? onPressed;
  final String text;
  final Color? bkColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 14),
            backgroundColor: bkColor ?? context.theme.appColors.surface,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: AppTextStyles.styleSemiBold24(context)
                    .copyWith(color: Colors.white),
              ),
              SizedBox(width: 10),
              icon == null
                  ? SizedBox.shrink()
                  : Icon(icon, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
