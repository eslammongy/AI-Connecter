import 'dart:io';

import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'social_auth_btn.dart';

class SocialAuthContainer extends StatelessWidget {
  const SocialAuthContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
              const SizedBox(height: 20),
            ] else ...[
              SocialAuthBtn(
                onPressed: () {},
                iconPath: AppAssetsManager.appleIcon,
                btnText: "Sign in with Apple",
                signInOption: SignInOption.apple,
              ),
              const SizedBox(height: 20),
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
