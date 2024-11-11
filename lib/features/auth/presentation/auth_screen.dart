import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/features/auth/presentation/social_auth_btn.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 60,
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(height: 20),
          SocialAuthBtn(
            onPressed: () {},
            iconPath: AppAssetsManager.googleIcon,
            btnText: "Sign in with Google",
            signInOption: SignInOption.google,
          ),
          SocialAuthBtn(
            onPressed: () {},
            iconPath: AppAssetsManager.appleIcon,
            btnText: "Sign in with Apple",
            signInOption: SignInOption.google,
          ),
          SocialAuthBtn(
            onPressed: () {},
            iconPath: AppAssetsManager.phoneIcon,
            btnText: "Sign in with Phone",
            signInOption: SignInOption.phone,
          ),
        ]),
      ),
    );
  }
}
