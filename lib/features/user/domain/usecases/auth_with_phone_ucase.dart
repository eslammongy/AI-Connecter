import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/user/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthWithPhoneUCase {
  final AuthRepository authRepository;
  AuthWithPhoneUCase({required this.authRepository});

  Future<Either<Failure, bool>> call({required String phone}) async =>
      await authRepository.signInWithPhoneOtp(phone: phone);
}
