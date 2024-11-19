import 'package:dartz/dartz.dart';
import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/user/domain/entities/user_entity.dart';
import 'package:ai_connect/features/user/domain/repositories/auth_repository.dart';

class AuthWithGoogleUCase {
  final AuthRepository authRepository;
  AuthWithGoogleUCase({required this.authRepository});

  Future<Either<Failure, UserEntity>> call({required String email}) async =>
      await authRepository.signInWithGoogleAccount(email: email);
}
