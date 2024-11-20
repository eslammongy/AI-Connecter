import 'package:ai_connect/core/utils/app_storage.dart';
import 'package:ai_connect/features/auth/data/datasource/supabase_client.dart';
import 'package:ai_connect/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ai_connect/features/auth/domain/repositories/auth_repository.dart';
import 'package:ai_connect/features/auth/domain/usecases/auth_with_apple_ucase.dart';
import 'package:ai_connect/features/auth/domain/usecases/auth_with_google_ucase.dart';
import 'package:ai_connect/features/auth/domain/usecases/auth_with_phone_ucase.dart';
import 'package:ai_connect/features/auth/domain/usecases/sign_out_ucase.dart';
import 'package:ai_connect/features/auth/domain/usecases/verify_phone_otp_ucase.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initServiceLocator() async {
  await AppStorage.init();
  // Supabase Client Dependency
  final supabaseClient = AppSupabaseClient();
  getIt.registerLazySingleton<AppSupabaseClient>(() => supabaseClient);
  await AppSupabaseClient.initialize();
  await initAuthModule(supabaseClient: supabaseClient);
}

Future<void> initAuthModule({required AppSupabaseClient supabaseClient}) async {
  // Auth Repository Dependency
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(supabaseClient: supabaseClient));

  // Auth UseCase Dependencies
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
      signOutUCase: getIt(),
    ),
  );
}
