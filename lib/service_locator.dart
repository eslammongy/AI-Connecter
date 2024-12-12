import 'package:ai_connect/core/constant/constants.dart';
import 'package:ai_connect/core/datasource/app_storage.dart';
import 'package:ai_connect/core/datasource/supabase_client.dart';
import 'package:ai_connect/core/utils/internet_checker_service.dart';
import 'package:ai_connect/features/auth/data/datasource/auth_service.dart';
import 'package:ai_connect/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ai_connect/features/auth/domain/repositories/auth_repository.dart';
import 'package:ai_connect/features/auth/domain/usecases/auth_with_apple_ucase.dart';
import 'package:ai_connect/features/auth/domain/usecases/auth_with_google_ucase.dart';
import 'package:ai_connect/features/auth/domain/usecases/auth_with_phone_ucase.dart';
import 'package:ai_connect/features/auth/domain/usecases/sign_out_ucase.dart';
import 'package:ai_connect/features/auth/domain/usecases/verify_phone_otp_ucase.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_connect/features/settings/data/repository/settings_repository_impl.dart';
import 'package:ai_connect/features/settings/domain/repository/settings_repository.dart';
import 'package:ai_connect/features/settings/domain/usecases/change_chatting_font_uc.dart';
import 'package:ai_connect/features/settings/domain/usecases/set_app_theme_uc.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:ai_connect/features/user/data/datasource/db_datasource.dart';
import 'package:ai_connect/features/user/data/repositories/user_profile_repository_impl.dart';
import 'package:ai_connect/features/user/domain/repositories/user_profile_repository.dart';
import 'package:ai_connect/features/user/domain/usecases/create_user_profile_ucase.dart';
import 'package:ai_connect/features/user/domain/usecases/fetch_user_profile_ucase.dart';
import 'package:ai_connect/features/user/domain/usecases/set_user_profile_img_ucase.dart';
import 'package:ai_connect/features/user/domain/usecases/update_user_profile_ucase.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'features/auth/domain/usecases/keep_user_logged_uc.dart';

final getIt = GetIt.instance;
late final GenerativeModel geminiModel;
late final bool isUserSigned;
Future<void> initAppDependencies() async {
  isUserSigned = await checkIsUserSigned();
  InternetConnectivityChecker.initialize();
  geminiModel = googleGeminiAI;
  await initSettingsModule(appStorage: appStorage);
  await initAuthModule(supabaseClient: supabaseClient, appStorage: appStorage);
  await initUserProfileModule(supabaseClient);
}

Future<bool> checkIsUserSigned() async {
  try {
    final token = await appStorage.getFromAppStorage(
      AppConstants.keepUserLoggedKey,
    );
    return token == null ? false : true;
  } catch (e) {
    return false;
  }
}

AppSupabaseClient get supabaseClient => AppSupabaseClient();

AppStorage get appStorage => AppStorage();

GenerativeModel get googleGeminiAI {
  return GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey: dotenv.get(AppConstants.googleGeminiAPIKey),
  );
}

Future<void> initUserProfileModule(AppSupabaseClient supabaseClient) async {
  final dbDataSource = DbDataSource(supabaseClient: supabaseClient);

  getIt.registerLazySingleton<UserProfileRepository>(
      () => UserProfileRepositoryImpl(dataSource: dbDataSource));

  getIt.registerLazySingleton<CreateUserProfileUCase>(
    () => CreateUserProfileUCase(
        userProfileRepository: getIt<UserProfileRepository>()),
  );
  getIt.registerLazySingleton<UpdateUserProfileUcase>(
    () => UpdateUserProfileUcase(
        userProfileRepository: getIt<UserProfileRepository>()),
  );
  getIt.registerLazySingleton<FetchUserProfileUcase>(
    () => FetchUserProfileUcase(
        userProfileRepository: getIt<UserProfileRepository>()),
  );
  getIt.registerLazySingleton<SetUserProfileImgUcase>(
    () => SetUserProfileImgUcase(
        userProfileRepository: getIt<UserProfileRepository>()),
  );
  // Bloc Dependency
  getIt.registerFactory<UserProfileBloc>(
    () => UserProfileBloc(
      createUserProfileUCase: getIt(),
      updateUserProfileUcase: getIt(),
      fetchUserProfileUcase: getIt(),
      setUserProfileImgUcase: getIt(),
    ),
  );
}

Future<void> initSettingsModule({required AppStorage appStorage}) async {
  getIt.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(appStorage: appStorage));

  getIt.registerLazySingleton<SetAppThemeUCase>(
    () => SetAppThemeUCase(
      settingsRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<ChangeChattingFontUCase>(
    () => ChangeChattingFontUCase(
      settingsRepository: getIt(),
    ),
  );

  getIt.registerFactory(
    () => SettingsBloc(
      switchAppThemeUCase: getIt<SetAppThemeUCase>(),
      changeChattingFontUCase: getIt<ChangeChattingFontUCase>(),
    ),
  );
}

Future<void> initAuthModule({
  required AppSupabaseClient supabaseClient,
  required AppStorage appStorage,
}) async {
  // Auth Repository Dependency
  final authService = AuthService(supabaseClient: supabaseClient);

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authService: authService, appStorage: appStorage),
  );

  getIt.registerLazySingleton<KeepUserSignedInUCase>(
    () => KeepUserSignedInUCase(
      authRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<AuthWithGoogleUCase>(
    () => AuthWithGoogleUCase(
      authRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<AuthWithAppleUCase>(
    () => AuthWithAppleUCase(
      authRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<AuthWithPhoneUCase>(
    () => AuthWithPhoneUCase(
      authRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<VerifyPhoneOtpUCase>(
    () => VerifyPhoneOtpUCase(
      authRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<SignOutUCase>(
    () => SignOutUCase(
      authRepository: getIt(),
    ),
  );

  // Bloc Dependency
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      authWithGoogleUCase: getIt(),
      authWithAppleUCase: getIt(),
      authWithPhoneUCase: getIt(),
      verifyPhoneOtpUCase: getIt(),
      keepUserSignedInUCase: getIt(),
      signOutUCase: getIt(),
    ),
  );
}
