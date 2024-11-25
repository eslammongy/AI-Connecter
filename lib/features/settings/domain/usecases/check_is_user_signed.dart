import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/core/utils/service_locator.dart';
import 'package:ai_connect/features/settings/domain/repository/settings_repository.dart';
import 'package:dartz/dartz.dart';

abstract class CheckIsUserSignedUCase {
  static Future<Either<Failure, bool>> call() async {
    return await getIt<SettingsRepository>().checkIsUserSigned();
  }
}
