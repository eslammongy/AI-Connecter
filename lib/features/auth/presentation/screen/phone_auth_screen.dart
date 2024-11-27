import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/constant/app_strings.dart';
import 'package:ai_connect/core/routes/app_routes.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/core/utils/dialog_manager.dart';
import 'package:ai_connect/core/utils/helper.dart';
import 'package:ai_connect/core/widgets/custom_elevated_btn.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_events.dart';
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
    String countryCode = "+20";
    final phoneNumController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          AppStrings.phoneAuthentication,
          style: AppTextStyles.styleBold20(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: BlocConsumer<AuthBloc, AuthStatus>(
            listener: (context, state) {
              if (state is AuthLoadingState) {
                LoadingDialogManager.of(context).displayDialog();
              }
              if (state is AuthPhoneSignedState) {
                LoadingDialogManager.closeDialog();
                GoRouter.of(context).push(
                  AppRoutes.otpVerificationScreen,
                  extra: state.phone,
                );
              }
              if (state is AuthFailureState) {
                LoadingDialogManager.closeDialog();
                debugPrint("PhoneErrorMsg: ${state.message}");
                displaySnackBar(context, state.message ?? "");
              }
            },
            builder: (context, state) {
              return Column(
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
                  PhoneSubmissionCountryCode(
                    phoneNumController: phoneNumController,
                    setCountryCode: (code) {
                      countryCode = code;
                    },
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  CustomElevatedBtn(
                    bkColor: theme.appColors.primary,
                    text: AppStrings.sendOtpCode,
                    onPressed: () {
                      final phoneNum = phoneNumController.text.trim();
                      _handleSubmitUserPhone(phoneNum, context, countryCode);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _handleSubmitUserPhone(
      String phoneNum, BuildContext context, String countryCode) {
    if (!isValidPhoneNumber(phoneNum)) {
      displaySnackBar(
        context,
        AppStrings.invalidPhoneNumberMsg,
      );
    } else {
      AuthBloc.get(context).add(
        AuthWithPhoneEvent(phone: "$countryCode$phoneNum"),
      );
    }
  }
}
