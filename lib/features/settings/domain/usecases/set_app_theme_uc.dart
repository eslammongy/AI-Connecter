import 'package:ai_connect/core/constant/constants.dart';
import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/settings/domain/repository/settings_repository.dart';
import 'package:dartz/dartz.dart';

class SetAppThemeUCase {
  final SettingsRepository settingsRepository;
  const SetAppThemeUCase({required this.settingsRepository});

  Future<Either<Failure, ThemeModes>> call({required ThemeModes mode}) async {
    return await settingsRepository.setAppThemeMode(mode: mode);
  }
}
