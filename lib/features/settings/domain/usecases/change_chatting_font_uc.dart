import 'package:ai_connect/core/constant/constants.dart';
import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/settings/domain/repository/settings_repository.dart';
import 'package:dartz/dartz.dart';

class ChangeChattingFontUCase {
  final SettingsRepository settingsRepository;
  const ChangeChattingFontUCase({required this.settingsRepository});

  Future<Either<Failure, FontFamily>> call({required FontFamily font}) async {
    return await settingsRepository.changeChattingFontStyle(font: font);
  }
}
