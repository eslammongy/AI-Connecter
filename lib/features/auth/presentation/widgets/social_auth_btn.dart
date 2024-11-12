import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SignInOption { google, phone, apple }

class SocialAuthBtn extends StatelessWidget {
  const SocialAuthBtn({
    super.key,
    required this.onPressed,
    required this.iconPath,
    required this.btnText,
    required this.signInOption,
  });
  final Function() onPressed;
  final String iconPath;
  final String btnText;
  final SignInOption signInOption;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 14),
        backgroundColor: handleBtnBkColor(signInOption, context),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                btnText,
                style: theme.textTheme.titleMedium?.copyWith(
                    color: signInOption == SignInOption.google
                        ? context.theme.appColors.surface
                        : Colors.white,
                    fontWeight: FontWeight.w700,),
              ),
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                iconPath,
                width: 28,
                fit: BoxFit.contain,
                colorFilter:signInOption != SignInOption.google ? ColorFilter.mode(Colors.white, BlendMode.srcIn): null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color handleBtnBkColor(SignInOption signInOption, BuildContext context) {
    switch (signInOption) {
      case SignInOption.google:
        return context.theme.appColors.onSurface;
      case SignInOption.phone:
         return context.theme.appColors.primary;
      case SignInOption.apple:
         return context.theme.appColors.surface;
    }
 }
}
