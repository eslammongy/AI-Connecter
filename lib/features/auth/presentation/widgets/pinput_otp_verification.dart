import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_events.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinPutOtpVerification extends StatelessWidget {
  const PinPutOtpVerification({
    super.key,
    required this.pinController,
    required this.phoneNum,
  });
  final TextEditingController pinController;
  final String phoneNum;

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    final theme = context.theme;
    return Pinput(
      controller: pinController,
      focusNode: focusNode,
      length: 6,
      defaultPinTheme: defaultPinTheme(theme),
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: (code) {
        AuthBloc.get(context).add(
          AuthVerifyPhoneOtpEvent(
            phone: phoneNum,
            otp: code,
          ),
        );
      },
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            width: 22,
            height: 1,
            color: theme.appColors.primary,
          ),
        ],
      ),
      focusedPinTheme: defaultPinTheme(theme).copyWith(
        decoration: defaultPinTheme(theme).decoration!.copyWith(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: theme.appColors.primary, width: 2),
            ),
      ),
      submittedPinTheme: defaultPinTheme(theme).copyWith(
        decoration: defaultPinTheme(theme).decoration!.copyWith(
              color: theme.appColors.secondary,
              borderRadius: BorderRadius.circular(19),
              border: Border.all(
                color: Colors.white,
              ),
            ),
      ),
      errorPinTheme: defaultPinTheme(theme).copyBorderWith(
        border: Border.all(color: theme.appColors.error),
      ),
    );
  }

  PinTheme defaultPinTheme(theme) => PinTheme(
        width: 56,
        height: 56,
        textStyle: TextStyle(
          fontSize: 22,
          color: theme.colorScheme.onSurface,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: theme.colorScheme.surfaceTint, width: 1.5),
        ),
      );
}
