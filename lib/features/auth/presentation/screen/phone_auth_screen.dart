import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/constant/app_strings.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/core/utils/app_routes.dart';
import 'package:ai_connect/core/utils/dialog_manager.dart';
import 'package:ai_connect/core/utils/helper.dart';
import 'package:ai_connect/core/utils/service_locator.dart';
import 'package:ai_connect/core/widgets/custom_elevated_btn.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_status.dart';
import 'package:ai_connect/features/auth/presentation/widgets/phone_submission_country_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PhoneAuthScreen extends StatelessWidget {
  const PhoneAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    String countryCode = '+20';
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthStatus>(
        listener: (context, state) {
          if (state is AuthStatusLoading) {
            LoadingDialogManager.of(context).displayDialog();
          }
          if (state is AuthStatusPhoneSignedSuccess) {
            LoadingDialogManager.closeDialog();
            GoRouter.of(context)
                .pushReplacement(AppRoutes.otpVerificationScreen);
          }
          if (state is AuthStatusFailure) {
            LoadingDialogManager.closeDialog();
            displaySnackBar(context, state.message ?? "");
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: theme.scaffoldBackgroundColor,
                title: Text(
                  AppStrings.phoneAuthentication,
                  style: AppTextStyles.styleBold20(context),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Image.asset(
                        AppAssetsManager.submitPhoneNumberImg,
                        width: 260,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      PhoneSubmissionCountryCode(),
                      SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: CustomElevatedBtn(
                          bkColor: theme.appColors.primary,
                          text: "Send Code",
                          onPressed: () async {},
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
