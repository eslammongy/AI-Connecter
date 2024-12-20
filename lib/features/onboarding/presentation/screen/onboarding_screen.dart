import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/constant/app_strings.dart';
import 'package:ai_connect/core/routes/app_routes.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/core/utils/helper.dart';
import 'package:ai_connect/core/widgets/custom_elevated_btn.dart';
import 'package:ai_connect/features/onboarding/model/onboarding_model.dart';
import 'package:ai_connect/features/onboarding/presentation/widgets/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: kToolbarHeight),
            // App Icon and Name
            buildOnboardingIntro(),
            SizedBox(height: 40),
            //onboarding items
            OnboardingItem(
              onboardingModel:
                  OnBoardingModel.listOfOnBoardingItems[currentIndex],
            ),
            currentIndex == 2
                ? CustomElevatedBtn(
                    text: AppStrings.getStarted,
                    bkColor: context.theme.appColors.primary,
                    icon: null,
                    onPressed: () {
                      GoRouter.of(context).pushReplacement(AppRoutes.auth);
                    },
                  )
                : CustomElevatedBtn(
                    text: AppStrings.next,
                    bkColor: context.theme.appColors.primary,
                    onPressed: () {
                      setState(() {
                        currentIndex++;
                      });
                    },
                  ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget buildOnboardingIntro() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
              color: context.theme.appColors.surface,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                staticBoxShadow,
              ]),
          child: Row(
            children: [
              Image.asset(
                AppAssetsManager.aiIMage,
                width: 35,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                AppStrings.appName,
                style: AppTextStyles.styleSemiBold24(context).copyWith(
                  fontFamily: AppAssetsManager.roboto,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "${currentIndex + 1} of 3",
                style: AppTextStyles.styleMedium20(context).copyWith(
                  fontFamily: AppAssetsManager.roboto,
                  color: context.theme.appColors.tertiary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
