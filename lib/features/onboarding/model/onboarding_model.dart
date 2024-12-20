import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/constant/app_strings.dart';

class OnBoardingModel {
  final int index;
  final String title;
  final String description;
  final String image;
  OnBoardingModel({
    required this.index,
    required this.title,
    required this.description,
    required this.image,
  });

  static final listOfOnBoardingItems = [
    OnBoardingModel(
      index: 0,
      title: AppStrings.onboardingTitle1,
      description: AppStrings.onboardingDesc1,
      image: AppAssetsManager.onboardingImg1,
    ),
    OnBoardingModel(
      index: 1,
      title: AppStrings.onboardingTitle2,
      description: AppStrings.onboardingDesc1,
      image: AppAssetsManager.onboardingImg2,
    ),
    OnBoardingModel(
      index: 2,
      title: AppStrings.onboardingTitle3,
      description: AppStrings.onboardingDesc1,
      image: AppAssetsManager.onboardingImg3,
    ),
  ];
}
