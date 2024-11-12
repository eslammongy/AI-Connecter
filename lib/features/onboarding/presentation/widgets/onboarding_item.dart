import 'package:ai_connect/features/onboarding/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.onboardingModel});
  final OnBoardingModel onboardingModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            onboardingModel.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 16),
        // Subtitle Text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            onboardingModel.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 40),
        Expanded(
          child: Center(
            child: Column(
              children: [
                SvgPicture.asset(
                  onboardingModel.image,
                  width: 320,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
