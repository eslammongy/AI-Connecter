import 'dart:io';

import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/user/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserProfileRepository {
  Future<Either<Failure, UserEntity>> createUserProfile(
      {required UserEntity user});

  Future<Either<Failure, UserEntity>> updateUserProfile(
      {required UserEntity user});

  Future<Either<Failure, UserEntity>> fetchUserProfile(
      {required String userId});

  Future<Either<Failure, String>> setUserProfileImg(
      {required File imgFile, required String userName});
}
