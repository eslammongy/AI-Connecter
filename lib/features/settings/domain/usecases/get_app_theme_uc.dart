import 'package:ai_connect/core/constant/constants.dart';
import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/core/utils/service_locator.dart';
import 'package:ai_connect/features/settings/domain/repository/settings_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetAppThemeUCase {
  // static final SettingsRepository settingsRepository;
  //
  // GetAppThemeUCase({required this.settingsRepository});

  static Future<Either<Failure, ThemeModes>> call() async {
    return await getIt<SettingsRepository>().getAppTheme();
  }
}
