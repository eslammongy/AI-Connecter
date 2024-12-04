import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/constant/app_strings.dart';
import 'package:ai_connect/core/routes/app_routes.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/core/utils/dialog_manager.dart';
import 'package:ai_connect/core/utils/helper.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_status.dart';
import 'package:ai_connect/features/auth/presentation/widgets/social_auth_container.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_bloc.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_events.dart';
import 'package:ai_connect/features/user/presentation/views/widgets/user_profile_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthStatus>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
            LoadingDialogManager.of(context).displayDialog();
          }
          if (state is AuthGoogleSignedState || state is AuthAppleSignedState) {
            // start creating user profile
            UserProfileBloc.get(context)
                .add(UserProfileCreateEvent(user: state.user!));
          }
          if (state is AuthKeepUserSignedInState) {
            GoRouter.of(context).pushReplacement(AppRoutes.dashboard);
          }
          if (state is AuthFailureState) {
            LoadingDialogManager.closeDialog();
            displaySnackBar(context, AppStrings.failureAuthMsg);
          }
        },
        builder: (context, state) {
          return UserProfileListener(
            child: Padding(
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
            ),
          );
        },
      ),
    );
  }
}
