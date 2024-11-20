import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/auth/domain/entities/user_entity.dart';
import 'package:ai_connect/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthWithGoogleUCase {
  final AuthRepository authRepository;
  AuthWithGoogleUCase({required this.authRepository});

  Future<Either<Failure, UserEntity>> call() async =>
      await authRepository.signInWithGoogleAccount();
}
