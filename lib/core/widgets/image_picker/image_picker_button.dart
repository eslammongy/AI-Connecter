import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ImagePickerButton extends StatelessWidget {
  const ImagePickerButton({super.key, this.onPressed});
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: TextButton.styleFrom(
          fixedSize: Size(50, 50),
          backgroundColor: context.theme.appColors.surface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(
              color: context.theme.appColors.tertiary,
              width: 2,
            ),
          )),
      onPressed: onPressed,
      icon: Icon(
        Icons.add_a_photo_rounded,
        color: context.theme.appColors.onSurface,
      ),
    );
  }
}
