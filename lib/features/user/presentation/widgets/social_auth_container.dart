import 'dart:io';

import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/utils/app_routes.dart';
import 'package:ai_connect/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'social_auth_btn.dart';

class SocialAuthContainer extends StatelessWidget {
  const SocialAuthContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(20) ,
        boxShadow: [staticBoxShadow],
      color: context.theme.appColors.surface.withOpacity(0.3),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 30,
        ),
        child: Column(
          children: [
            if (Platform.isAndroid) ...[
              SocialAuthBtn(
                onPressed: () {
                  GoRouter.of(context).pushReplacement(AppRoutes.dashboard);
                },
                iconPath: AppAssetsManager.googleIcon,
                btnText: "Sign in with Google",
                signInOption: SignInOption.google,
              ),
              const SizedBox(height: 30),
            ] else ...[
              SocialAuthBtn(
                onPressed: () {},
                iconPath: AppAssetsManager.appleIcon,
                btnText: "Sign in with Apple",
                signInOption: SignInOption.apple,
              ),
              const SizedBox(height: 30),
            ],
            SocialAuthBtn(
              onPressed: () {},
              iconPath: AppAssetsManager.phoneIcon,
              btnText: "Sign in with Phone",
              signInOption: SignInOption.phone,
            ),
          ],
        ),
      ),
    );
  }
}
