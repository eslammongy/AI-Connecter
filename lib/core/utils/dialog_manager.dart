import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoadingDialogManager {
  static BuildContext? _context;
  // build a singleton instance
  static final LoadingDialogManager _instance =
      LoadingDialogManager._internal();

  // create a private named constructor
  LoadingDialogManager._internal();

  factory LoadingDialogManager.of(BuildContext context) {
    _context = context;
    return _instance;
  }
  // Show the dialog
  void displayDialog({
    String? message = "Please waiting...",
  }) {
    if (_context == null || !_context!.mounted) return;
    showDialog(
      context: _context!,
      barrierDismissible: false, // Prevents dismissing the dialog
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 100),
          backgroundColor: context.theme.appColors.background.withOpacity(0.9),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 120,
              maxWidth: 100,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  strokeWidth: 6,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    context.theme.appColors.primary,
                  ),
                  strokeCap: StrokeCap.round,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  message ?? '',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.styleBold20(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Close the dialog
  static void closeDialog() {
    if (_context != null && _context!.mounted) {
      _context!.canPop() ? _context!.pop() : null;
    }
  }
}
