import 'package:dartz/dartz.dart';
import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/auth/domain/repositories/auth_repository.dart';

class SignOutUCase {
  final AuthRepository authRepository;
  SignOutUCase({required this.authRepository});

  Future<Either<Failure, bool>> call() async => await authRepository.signOut();
}
