import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignOutUCase {
  final AuthRepository authRepository;
  SignOutUCase({required this.authRepository});

  Future<Either<Failure, void>> call() async => await authRepository.signOut();
}
