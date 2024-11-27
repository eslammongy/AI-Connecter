import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/user/domain/entities/user_entity.dart';
import 'package:ai_connect/features/user/domain/repositories/user_profile_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateUserProfileUcase {
  final UserProfileRepository userProfileRepository;
  const UpdateUserProfileUcase({required this.userProfileRepository});

  Future<Either<Failure, UserEntity>> call({
    required UserEntity user,
  }) =>
      userProfileRepository.updateUserProfile(user: user);
}
