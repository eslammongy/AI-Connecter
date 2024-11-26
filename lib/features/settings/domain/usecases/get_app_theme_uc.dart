import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/settings/domain/repository/settings_repository.dart';
import 'package:ai_connect/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class GetAppThemeUCase {
  // static final SettingsRepository settingsRepository;
  //
  // GetAppThemeUCase({required this.settingsRepository});

  static Future<Either<Failure, ThemeMode>> call() async {
    return await getIt<SettingsRepository>().getAppTheme();
  }
}
