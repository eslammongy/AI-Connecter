import 'package:ai_connect/core/constant/constants.dart';
import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/settings/data/datasource/app_storage.dart';
import 'package:ai_connect/features/settings/domain/repository/settings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final AppStorage appStorage;
  SettingsRepositoryImpl({required this.appStorage});
  @override
  Future<Either<Failure, FontFamily>> changeChattingFontStyle({
    required FontFamily font,
  }) async {
    try {
      await appStorage.putInAppStorage(
        AppConstants.selectedChattingFontKey,
        font.value,
      );
      return Right(font);
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> keepUserLogged({required String value}) async {
    try {
      await appStorage.putInAppStorage(AppConstants.keepUserLoggedKey, value);
      return const Right(true);
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resetUserSession() async {
    try {
      await appStorage.putInAppStorage(AppConstants.keepUserLoggedKey, null);
      return Right(null);
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ThemeMode>> setAppThemeMode({
    required ThemeMode mode,
  }) async {
    try {
      await appStorage.putInAppStorage(
        AppConstants.selectedThemeModeKey,
        mode.name,
      );
      return Right(mode);
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ThemeMode>> getAppTheme() async {
    try {
      final result = await appStorage.getFromAppStorage(
        AppConstants.selectedThemeModeKey,
      );
      final theme = ThemeMode.values.byName(result!);
      return Right(theme);
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FontFamily>> getChattingFont() async {
    try {
      final result = await appStorage.getFromAppStorage(
        AppConstants.selectedChattingFontKey,
      );
      final font = FontFamily.values.byName(result!);
      return Right(font);
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }
}
