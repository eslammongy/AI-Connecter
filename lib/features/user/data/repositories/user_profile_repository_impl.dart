import 'dart:io';

import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/user/domain/entities/user_entity.dart';
import 'package:ai_connect/features/user/domain/repositories/user_profile_repository.dart';
import 'package:dartz/dartz.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  @override
  Future<Either<Failure, UserEntity>> createUserProfile(
      {required UserEntity user}) {
    // TODO: implement createUserProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> fetchUserProfile(
      {required String userId}) {
    // TODO: implement fetchUserProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> updateUserProfile(
      {required UserEntity user}) {
    // TODO: implement updateUserProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> setUserProfileImg({required File imgFile}) {
    // TODO: implement setUserProfileImg
    throw UnimplementedError();
  }
}
