import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class KeepUserSignedInUCase {
  final AuthRepository authRepository;
  const KeepUserSignedInUCase({required this.authRepository});

  Future<Either<Failure, String?>> call({
    String? value,
  }) async {
    return await authRepository.keepUserSignedIn(
      token: value,
    );
  }
}
