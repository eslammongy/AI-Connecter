import 'package:ai_connect/core/constant/constants.dart';
import 'package:ai_connect/core/error/api_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class SettingsRepository {
  Future<Either<Failure, bool>> keepUserLogged({
    required String value,
  });

  Future<Either<Failure, bool>> checkIsUserSigned();

  Future<Either<Failure, ThemeMode>> setAppThemeMode({
    required ThemeMode mode,
  });
  Future<Either<Failure, FontFamily>> changeChattingFontStyle({
    required FontFamily font,
  });
  Future<Either<Failure, void>> resetUserSession();

  Future<Either<Failure, ThemeMode>> getAppTheme();

  Future<Either<Failure, FontFamily>> getChattingFont();
}
