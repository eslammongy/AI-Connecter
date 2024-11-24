import 'package:ai_connect/core/constant/constants.dart';
import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/settings/data/datasource/app_storage.dart';
import 'package:ai_connect/features/settings/domain/repository/settings_repository.dart';
import 'package:dartz/dartz.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final AppStorage appStorage;
  SettingsRepositoryImpl({required this.appStorage});
  @override
  Future<Either<Failure, FontFamily>> changeChattingFontStyle({
    required FontFamily font,
  }) async {
    try {
      await appStorage.putInAppStorage(
        AppConstants.selectedChattingFontKey,
        font.value,
      );
      return Right(font);
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> keepUserLogged({required String value}) async {
    try {
      await appStorage.putInAppStorage(AppConstants.keepUserLoggedKey, value);
      return const Right(true);
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> resetUserSession() async {
    try {
      await appStorage.putInAppStorage(AppConstants.keepUserLoggedKey, null);
      return const Right(false);
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ThemeModes>> switchAppThemeMode({
    required ThemeModes mode,
  }) async {
    try {
      await appStorage.putInAppStorage(
        AppConstants.selectedThemeModeKey,
        mode.value,
      );
      return Right(mode);
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }
}
