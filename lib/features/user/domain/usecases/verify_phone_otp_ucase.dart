import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/user/domain/entities/user_entity.dart';
import 'package:ai_connect/features/user/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class VerifyPhoneOtpUCase {
  final AuthRepository authRepository;
  VerifyPhoneOtpUCase({required this.authRepository});

  Future<Either<Failure, UserEntity>> call({
    required String phone,
    required String otp,
  }) async =>
      await authRepository.verificationWithPhoneOtp(
        phone: phone,
        otp: otp,
      );
}
