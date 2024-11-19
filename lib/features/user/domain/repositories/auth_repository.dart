import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/user/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> signOut();

  Future<Either<Failure, UserEntity>> signInWithGoogleAccount({
    required String email,
  });

  Future<Either<Failure, UserEntity>> signInWithAppleAccount({
    required String email,
  });

  Future<Either<Failure, bool>> signInWithPhoneOtp({
    required String phone,
  });

  Future<Either<Failure, UserEntity>> verificationWithPhoneOtp({
    required String phone,
    required String otp,
  });
}
