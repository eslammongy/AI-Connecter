import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/settings/domain/repository/settings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class SetAppThemeUCase {
  final SettingsRepository settingsRepository;
  const SetAppThemeUCase({required this.settingsRepository});

  Future<Either<Failure, ThemeMode>> call({required ThemeMode mode}) async {
    return await settingsRepository.setAppThemeMode(mode: mode);
  }
}
