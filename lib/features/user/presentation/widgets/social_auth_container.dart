import 'dart:io';

import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/utils/helper.dart';
import 'package:ai_connect/features/user/data/datasource/supabase_client.dart';
import 'package:ai_connect/features/user/data/repositories/auth_repository_impl.dart';
import 'package:ai_connect/features/user/domain/usecases/auth_with_phone_ucase.dart';
import 'package:ai_connect/features/user/presentation/widgets/social_auth_btn.dart';
import 'package:flutter/material.dart';

class SocialAuthContainer extends StatelessWidget {
  const SocialAuthContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
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
                onPressed: () async {
                  //GoRouter.of(context).pushReplacement(AppRoutes.dashboard);
                },
                iconPath: AppAssetsManager.googleIcon,
                btnText: "Sign in with Google",
                signInOption: AuthOption.google,
              ),
              const SizedBox(height: 30),
            ] else ...[
              SocialAuthBtn(
                onPressed: () {
                  //GoRouter.of(context).pushReplacement(AppRoutes.dashboard);
                },
                iconPath: AppAssetsManager.appleIcon,
                btnText: "Sign in with Apple",
                signInOption: AuthOption.apple,
              ),
              const SizedBox(height: 30),
            ],
            SocialAuthBtn(
              onPressed: () async {
                final supabaseClient = AppSupabaseClient();
                final authRepository =
                    AuthRepositoryImpl(supabaseClient: supabaseClient);
                final authPhone =
                    AuthWithPhoneUCase(authRepository: authRepository);
                await authPhone.call(phone: "201009370521");
              },
              iconPath: AppAssetsManager.phoneIcon,
              btnText: "Sign in with Phone",
              signInOption: AuthOption.phone,
            ),
          ],
        ),
      ),
    );
  }
}
