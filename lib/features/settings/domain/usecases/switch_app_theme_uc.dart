import 'package:ai_connect/core/constant/constants.dart';
import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/settings/domain/repository/settings_repository.dart';
import 'package:dartz/dartz.dart';

class SwitchAppThemeUCase {
  final SettingsRepository settingsRepository;
  const SwitchAppThemeUCase({required this.settingsRepository});

  Future<Either<Failure, ThemeModes>> call({required ThemeModes mode}) async {
    return await settingsRepository.switchAppThemeMode(mode: mode);
  }
}
