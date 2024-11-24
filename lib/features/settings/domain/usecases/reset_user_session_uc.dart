import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/settings/domain/repository/settings_repository.dart';
import 'package:dartz/dartz.dart';

class ResetUserSessionUCase {
  final SettingsRepository settingsRepository;
  const ResetUserSessionUCase({required this.settingsRepository});

  Future<Either<Failure, bool>> call() async {
    return await settingsRepository.resetUserSession();
  }
}
