import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/constant/app_strings.dart';
import 'package:ai_connect/core/routes/app_routes.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/core/utils/dialog_manager.dart';
import 'package:ai_connect/core/utils/helper.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_status.dart';
import 'package:ai_connect/features/auth/presentation/widgets/pinput_otp_verification.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_bloc.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_events.dart';
import 'package:ai_connect/features/user/presentation/views/widgets/user_profile_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key, required this.phoneNum});

  final String phoneNum;

  @override
  Widget build(BuildContext context) {
    final pinController = TextEditingController();
    final theme = context.theme;

    return BlocConsumer<AuthBloc, AuthStatus>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          LoadingDialogManager.of(context).displayDialog();
        }
        if (state is AuthOtpVerifiedState) {
          // start creating user profile
          LoadingDialogManager.closeDialog();
          UserProfileBloc.get(context)
              .add(UserProfileCreateEvent(user: state.user!));
        }
        if (state is AuthKeepUserSignedInState) {
          GoRouter.of(context).pushReplacement(AppRoutes.dashboard);
        }
        if (state is AuthFailureState) {
          LoadingDialogManager.closeDialog();
          displaySnackBar(context, state.message ?? "");
        }
      },
      builder: (context, state) {
        return UserProfileListener(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: theme.appColors.background,
              title: Text(
                AppStrings.phoneAuthentication,
                style: AppTextStyles.styleBold20(context),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 60),
                    Text(
                      AppStrings.otpVerificationMsg,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.styleBold30(context),
                    ),
                    const SizedBox(height: 10),
                    SvgPicture.asset(
                      AppAssetsManager.verifyOtpImage,
                      fit: BoxFit.cover,
                      width: 280,
                    ),
                    SizedBox(height: 25),
                    PinPutOtpVerification(
                      pinController: pinController,
                      phoneNum: phoneNum,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
