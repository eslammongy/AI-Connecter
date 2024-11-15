import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/utils/size_config.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle styleRegular16(context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w400,
        fontFamily: AppAssetsManager.inter);
  }

  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w700,
        fontFamily: AppAssetsManager.inter);
  }

  static TextStyle styleMedium16(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w500,
        fontFamily: AppAssetsManager.inter);
  }

  static TextStyle styleMedium18(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeight.w500,
        fontFamily: AppAssetsManager.inter);
  }

  static TextStyle styleMedium20(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w500,
        fontFamily: AppAssetsManager.inter);
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w600,
        fontFamily: AppAssetsManager.inter);
  }

  static TextStyle styleSemiBold20(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w600,
        fontFamily: AppAssetsManager.inter);
  }

  static TextStyle styleBold20(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w700,
        fontFamily: AppAssetsManager.inter);
  }

  static TextStyle styleSemiBold30(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 30),
        fontWeight: FontWeight.w600,
        fontFamily: AppAssetsManager.inter);
  }

  static TextStyle styleBold52(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 52),
        fontWeight: FontWeight.w700,
        fontFamily: AppAssetsManager.inter);
  }

  static TextStyle styleBold40(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 40),
        fontWeight: FontWeight.w700,
        fontFamily: AppAssetsManager.inter);
  }

  static TextStyle styleBold30(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 30),
        fontWeight: FontWeight.w700,
        fontFamily: AppAssetsManager.inter);
  }

  static TextStyle styleRegular12(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 12),
        fontWeight: FontWeight.w400,
        fontFamily: AppAssetsManager.inter);
  }

  static TextStyle styleSemiBold24(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 24),
        fontWeight: FontWeight.w600,
        fontFamily: AppAssetsManager.inter);
  }

  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontWeight: FontWeight.w400,
        fontFamily: AppAssetsManager.inter);
  }

  static TextStyle styleSemiBold18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w600,
    );
  }
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1420;
  }
}
