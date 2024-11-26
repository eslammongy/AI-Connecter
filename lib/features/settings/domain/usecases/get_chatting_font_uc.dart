import 'package:ai_connect/core/constant/constants.dart';
import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/settings/domain/repository/settings_repository.dart';
import 'package:ai_connect/service_locator.dart';
import 'package:dartz/dartz.dart';

class GetChattingFontUCase {
  // final SettingsRepository settingsRepository;
  //
  // GetChattingFontUCase({required this.settingsRepository});

  static Future<Either<Failure, FontFamily>> call() async {
    return await getIt<SettingsRepository>().getChattingFont();
  }
}
