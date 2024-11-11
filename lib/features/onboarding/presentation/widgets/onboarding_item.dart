import 'package:ai_connect/features/onboarding/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.onboardingModel});
  final OnBoardingModel onboardingModel;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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

      // Robot Image and Chat Bubbles
      Expanded(
        child: Center(
          child: Column(
            children: [
              // Robot Image (Replace with your asset if available)
              SvgPicture.asset(
                onboardingModel
                    .image, // Replace with the path to your robot image asset
                height: 300,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    ]);
  }
}
