import 'package:ai_connect/core/constant/constants.dart';
import 'package:ai_connect/core/datasource/app_storage.dart';
import 'package:ai_connect/core/error/api_error_msg.dart';
import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/auth/data/datasource/auth_service.dart';
import 'package:ai_connect/features/auth/domain/repositories/auth_repository.dart';
import 'package:ai_connect/features/user/data/models/user_model.dart';
import 'package:ai_connect/features/user/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService authService;
  final AppStorage appStorage;

  AuthRepositoryImpl({
    required this.authService,
    required this.appStorage,
  });

  @override
  Future<Either<Failure, UserEntity>> signInWithAppleAccount() {
    // TODO: implement signInWithAppleAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogleAccount() async {
    try {
      final authToken = await _googleSignIne();
      if (authToken == null) {
        return Left(catchAuthExp());
      }
      final response = await authService.signInWithIdToken(
        idToken: authToken,
        provider: OAuthProvider.google,
      );
      return userMetaDataExtractor(response);
    } on Exception catch (ex) {
      return Left(catchAuthExp(ex: ex));
    }
  }

  SupabaseExceptionHandler catchAuthExp({Exception? ex}) {
    if (ex != null && ex is AuthException) {
      return SupabaseExceptionHandler.authError(exp: ex);
    }
    ex = AuthException("", statusCode: 'unknownError');
    return SupabaseExceptionHandler.authError(exp: ex);
  }

  Either<Failure, UserEntity> userMetaDataExtractor(AuthResponse response) {
    if (response.user == null || response.user?.appMetadata == null) {
      return Left(
        catchAuthExp(
          ex: AuthException("",
              statusCode: SupabaseErrorCode.userNotFound.name),
        ),
      );
    }
    final metaData = response.user?.appMetadata;
    final accessToken = response.session?.accessToken;
    metaData!['token'] = accessToken;
    return Right(UserModel.fromMap(metaData));
  }

  Future<String?> _googleSignIne() async {
    final webClientId = dotenv.get(AppConstants.googleWebClientId);
    final iosClientId = dotenv.get(AppConstants.appleWebClientId);

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final idToken = googleAuth.idToken;
    return idToken;
  }

  @override
  Future<Either<Failure, bool>> signInWithPhoneOtp(
      {required String phone}) async {
    try {
      await authService.signInWithOtp(phone: phone);
      return const Right(true);
    } on Exception catch (ex) {
      return Left(catchAuthExp(ex: ex));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> verificationWithPhoneOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      final response = await authService.verifyOtp(
        phone: phone,
        otp: otp,
      );
      return userMetaDataExtractor(response);
    } on Exception catch (ex) {
      return Left(catchAuthExp(ex: ex));
    }
  }

  @override
  Future<Either<Failure, String?>> keepUserSignedIn({
    String? token,
  }) async {
    try {
      await appStorage.putInAppStorage(AppConstants.keepUserLoggedKey, token);
      return Right(token);
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await authService.signOut();
      return const Right(null);
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }
}
