import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/settings/domain/repository/settings_repository.dart';
import 'package:dartz/dartz.dart';

class KeepUserLoggedUCase {
  final SettingsRepository settingsRepository;
  const KeepUserLoggedUCase({required this.settingsRepository});

  Future<Either<Failure, bool>> call({required String value}) async {
    return await settingsRepository.keepUserLogged(value: value);
  }
}
