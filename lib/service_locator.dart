import 'package:ai_connect/core/constant/constants.dart';
import 'package:ai_connect/core/datasource/app_storage.dart';
import 'package:ai_connect/core/datasource/supabase_client.dart';
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
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'features/auth/domain/usecases/keep_user_logged_uc.dart';

final getIt = GetIt.instance;

Future<void> initAppDependencies() async {
  await dotenv.load(fileName: ".env");
  await initGoogleGeminiAI();
  AppStorage appStorage = initAppStorage();
  await initSettingsModule(appStorage: appStorage);
  // Supabase Client Dependency
  AppSupabaseClient supabaseClient = await initSupabaseClient();
  await initAuthModule(supabaseClient: supabaseClient, appStorage: appStorage);
}

Future<AppSupabaseClient> initSupabaseClient() async {
  final supabaseClient = AppSupabaseClient();
  await AppSupabaseClient.initialize();
  getIt.registerLazySingleton<AppSupabaseClient>(() => supabaseClient);
  return supabaseClient;
}

Future<void> initGoogleGeminiAI() async {
  final geminiAI = GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey: dotenv.get(AppConstants.googleGeminiAPIKey),
  );
  getIt.registerLazySingleton<GenerativeModel>(() => geminiAI);
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

AppStorage initAppStorage() {
  final appStorage = AppStorage();
  return getIt.registerSingleton<AppStorage>(appStorage);
}

Future<void> initAuthModule({
  required AppSupabaseClient supabaseClient,
  required AppStorage appStorage,
}) async {
  // Auth Repository Dependency
  getIt.registerLazySingleton<AuthService>(
    () => AuthService(supabaseClient: supabaseClient),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
        authService: getIt<AuthService>(), appStorage: appStorage),
  );

  // Auth UseCase Dependencies

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
