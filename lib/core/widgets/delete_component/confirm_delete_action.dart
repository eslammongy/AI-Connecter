import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

confirmDeleteAction(BuildContext context, {required Function() userLogout}) {
  final theme = context.theme;
  return AlertDialog(
      backgroundColor: theme.appColors.surface,
      elevation: 3,
      titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      title: Row(
        children: [
          Icon(Icons.info, color: theme.appColors.error),
          const SizedBox(
            width: 6,
          ),
          Text(
            "Sign out",
            style: AppTextStyles.styleSemiBold24(context),
          ),
        ],
      ),
      content: Text(
        "Are you sure you want to confirm delete?",
        textAlign: TextAlign.center,
        style: AppTextStyles.styleMedium20(context),
      ),
      actionsPadding: const EdgeInsets.symmetric(vertical: 15),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildTextBtnWidget(
              context,
              btnText: "Cancel",
              hasBorderSide: true,
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            buildTextBtnWidget(
              context,
              btnText: "Sign out",
              bkColor: theme.appColors.error,
              onPressed: userLogout,
            ),
          ],
        )
      ]);
}

Widget buildTextBtnWidget(
  BuildContext context, {
  required Function() onPressed,
  required String btnText,
  bool hasBorderSide = false,
  Color? textColor,
  Color? bkColor,
}) {
  /// define default style for button
  final theme = context.theme;

  return TextButton(
    style: textBtnStyle(
      theme: theme,
      hasBorderSide: hasBorderSide,
      bkColor: bkColor,
    ),
    onPressed: onPressed,
    child: Text(
      btnText,
      style: AppTextStyles.styleMedium18(context).copyWith(
        color: theme.appColors.onSurface,
      ),
    ),
  );
}

ButtonStyle textBtnStyle({
  required ThemeData theme,
  bool hasBorderSide = false,
  Color? bkColor,
}) =>
    TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        side: hasBorderSide
            ? BorderSide(
                width: 2,
                color: theme.appColors.error,
              )
            : BorderSide.none,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: bkColor ?? Colors.transparent,
    );
