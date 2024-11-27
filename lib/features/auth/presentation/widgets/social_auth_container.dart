import 'dart:io';

import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/constant/app_strings.dart';
import 'package:ai_connect/core/routes/app_routes.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/utils/helper.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_events.dart';
import 'package:ai_connect/features/auth/presentation/widgets/social_auth_btn.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SocialAuthContainer extends StatelessWidget {
  const SocialAuthContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = AuthBloc.get(context);
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
                onPressed: () {
                  authBloc.add(AuthWithGoogleEvent());
                },
                iconPath: AppAssetsManager.googleIcon,
                btnText: AppStrings.signInWithGoogle,
                signInOption: AuthOption.google,
              ),
              const SizedBox(height: 30),
            ] else ...[
              SocialAuthBtn(
                onPressed: () {
                  authBloc.add(AuthWithAppleEvent());
                },
                iconPath: AppAssetsManager.appleIcon,
                btnText: AppStrings.signInWithApple,
                signInOption: AuthOption.apple,
              ),
              const SizedBox(height: 30),
            ],
            SocialAuthBtn(
              onPressed: () async {
                GoRouter.of(context).push(AppRoutes.phoneAuthScreen);
              },
              iconPath: AppAssetsManager.phoneIcon,
              btnText: AppStrings.signInWithPhone,
              signInOption: AuthOption.phone,
            ),
          ],
        ),
      ),
    );
  }
}
