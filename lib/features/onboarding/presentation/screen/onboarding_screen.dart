import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/constant/app_strings.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/core/utils/size_config.dart';
import 'package:ai_connect/core/widgets/custom_elvated_btn.dart';
import 'package:ai_connect/features/onboarding/model/onboarding_model.dart';
import 'package:ai_connect/features/onboarding/presentation/widgets/onboarding_item.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // App Icon and Name
            buildOnboardingIntro(),
            SizedBox(height: 40),
            //onboarding items
            SizedBox(
              height: (SizeConfig.height * 0.65),
              child: OnboardingItem(
                onboardingModel:
                    OnBoardingModel.listOfOnBoardingItems[currentIndex],
              ),
            ),
            // Get Started Button
            CustomElevatedBtn(
              onPressed: () {
                setState(() {
                  currentIndex++;
                });
              },
            ),
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
          ),
          child: Row(
            children: [
              Image.asset(
                AppAssetsManager.aiIMage,
                width: 35,
              ),
              SizedBox(width: 5),
              Text(
                AppStrings.appName,
                style: AppTextStyles.styleSemiBold24(context).copyWith(
                  fontFamily: AppAssetsManager.roboto,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
