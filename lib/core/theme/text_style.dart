import 'package:flutter/material.dart';
import 'package:ai_connect/core/utils/size_config.dart';
import 'package:ai_connect/core/constant/app_assets_manager.dart';

abstract class AppTextStyles {
  static TextStyle _style({
    required BuildContext context,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return TextStyle(
      fontSize: SizeConfig().scaleText(fontSize),
      fontWeight: fontWeight,
      fontFamily: AppAssetsManager.inter,
    );
  }

  static TextStyle styleRegular16(context) {
    return _style(
      context: context,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return _style(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      context: context,
    );
  }

  static TextStyle styleMedium16(BuildContext context) {
    return _style(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      context: context,
    );
  }

  static TextStyle styleMedium18(BuildContext context) {
    return _style(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      context: context,
    );
  }

  static TextStyle styleMedium20(BuildContext context) {
    return _style(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      context: context,
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return _style(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      context: context,
    );
  }

  static TextStyle styleSemiBold20(BuildContext context) {
    return _style(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      context: context,
    );
  }

  static TextStyle styleBold20(BuildContext context) {
    return _style(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      context: context,
    );
  }

  static TextStyle styleSemiBold30(BuildContext context) {
    return _style(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      context: context,
    );
  }

  static TextStyle styleBold52(BuildContext context) {
    return _style(
      fontSize: 52,
      fontWeight: FontWeight.w700,
      context: context,
    );
  }

  static TextStyle styleBold40(BuildContext context) {
    return _style(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      context: context,
    );
  }

  static TextStyle styleBold30(BuildContext context) {
    return _style(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      context: context,
    );
  }

  static TextStyle styleRegular12(BuildContext context) {
    return _style(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      context: context,
    );
  }

  static TextStyle styleSemiBold24(BuildContext context) {
    return _style(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      context: context,
    );
  }

  static TextStyle styleRegular14(BuildContext context) {
    return _style(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      context: context,
    );
  }

  static TextStyle styleSemiBold18(BuildContext context) {
    return _style(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      context: context,
    );
  }
}