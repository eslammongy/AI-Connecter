import 'package:ai_connect/core/constant/constants.dart';
import 'package:ai_connect/core/error/api_failure.dart';
import 'package:dartz/dartz.dart';

abstract class SettingsRepository {
  Future<Either<Failure, bool>> keepUserLogged({
    required String value,
  });
  Future<Either<Failure, ThemeModes>> switchAppThemeMode({
    required ThemeModes mode,
  });
  Future<Either<Failure, FontFamily>> changeChattingFontStyle({
    required FontFamily font,
  });
  Future<Either<Failure, bool>> resetUserSession();
}
