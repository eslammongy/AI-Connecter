import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/user/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class UserProfileRepository {
  Future<Either<Failure, UserEntity>> createUserProfile(
      {required UserEntity user});

  Future<Either<Failure, UserEntity>> updateUserProfile(
      {required UserEntity user});

  Future<Either<Failure, UserEntity>> fetchUserProfile();

  Future<Either<Failure, String>> setUserProfileImg({required XFile imgFile});
}
