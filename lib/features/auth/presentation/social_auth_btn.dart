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
      child: InkWell(
        onTap: onPressed,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: handleBtnBkColor(signInOption, theme),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 20,
                ),
                SvgPicture.asset(
                  iconPath,
                  width: 32,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  btnText,
                  style: theme.textTheme.titleMedium?.copyWith(
                      color: signInOption == SignInOption.google
                          ? theme.colorScheme.background
                          : Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color handleBtnBkColor(SignInOption signInOption, ThemeData theme) {
    switch (signInOption) {
      case SignInOption.google:
        return theme.colorScheme.onSurface;
      case SignInOption.phone:
        return theme.colorScheme.surface;
      case SignInOption.apple:
        return theme.colorScheme.surface;
    }
  }
}
//