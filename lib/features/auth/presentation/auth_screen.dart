import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/constant/app_strings.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/features/auth/presentation/social_auth_btn.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssetsManager.aiIMage,
              fit: BoxFit.contain,
              width: 200,
            ),
            SizedBox(
              height: 20,
            ),
             Text(
                  AppStrings.appName,
                  style: AppTextStyles.styleBold40(context).copyWith(
                      fontFamily: AppAssetsManager.roboto
                      ,
                      fontWeight: FontWeight.w700,),
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
            const SizedBox(height: 20),
            SocialAuthBtn(
              onPressed: () {},
              iconPath: AppAssetsManager.appleIcon,
              btnText: "Sign in with Apple",
              signInOption: SignInOption.apple,
            ),
            const SizedBox(height: 20),
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
