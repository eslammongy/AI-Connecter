import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/constant/app_strings.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/core/utils/dialog_manager.dart';
import 'package:ai_connect/core/utils/helper.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_status.dart';
import 'package:ai_connect/features/auth/presentation/widgets/social_auth_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthStatus>(
        listener: (context, state) {
          if (state is AuthStatusLoading) {
            LoadingDialogManager.of(context).displayDialog();
          }
          if (state is AuthStatusGoogleSignedSuccess) {
            //GoRouter.of(context).pushReplacement(AppRoutes.dashboard);
            LoadingDialogManager.closeDialog();
            displaySnackBar(context, "Signed in successfully");
          }
          if (state is AuthStatusFailure) {
            LoadingDialogManager.closeDialog();
            displaySnackBar(
                context, "Sorry, something went wrong please try again");
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssetsManager.aiIMage,
                  fit: BoxFit.contain,
                  width: 180,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  AppStrings.appName,
                  style: AppTextStyles.styleBold40(context).copyWith(
                    fontFamily: AppAssetsManager.roboto,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(height: 20),
                SocialAuthContainer()
              ],
            ),
          );
        },
      ),
    );
  }
}