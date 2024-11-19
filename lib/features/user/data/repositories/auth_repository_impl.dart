import 'package:ai_connect/core/constant/constants.dart';
import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/user/data/datasource/supabase_client.dart';
import 'package:ai_connect/features/user/data/models/user_model.dart';
import 'package:ai_connect/features/user/domain/entities/user_entity.dart';
import 'package:ai_connect/features/user/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AppSupabaseClient supabaseClient;

  AuthRepositoryImpl({required this.supabaseClient});

  @override
  Future<Either<Failure, UserEntity>> signInWithAppleAccount(
      {required String email}) {
    // TODO: implement signInWithAppleAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogleAccount(
      {required String email}) async {
    try {
      final authToken = await _googleSignIne(email: email);
      if (authToken == null) {
        return Left(ServerFailure(message: 'No Access Token found.'));
      }
      final response = await supabaseClient.signInWithIdToken(
        idToken: authToken,
        provider: OAuthProvider.google,
      );
      return userMetaDataExtractor(response);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Either<Failure, UserEntity> userMetaDataExtractor(AuthResponse response) {
    if (response.user == null || response.user?.appMetadata == null) {
      return Left(ServerFailure(message: 'No User found.'));
    }
    final metaData = response.user?.appMetadata;
    return Right(UserModel.fromMap(metaData!));
  }

  Future<String?> _googleSignIne({required String email}) async {
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
      await supabaseClient.signInWithOtp(phone: phone);
      return const Right(true);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> verificationWithPhoneOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      final response = await supabaseClient.verifyOtp(
        phone: phone,
        otp: otp,
      );
      return userMetaDataExtractor(response);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
