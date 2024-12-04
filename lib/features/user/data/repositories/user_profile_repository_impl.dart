import 'dart:io';

import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/user/data/datasource/db_datasource.dart';
import 'package:ai_connect/features/user/data/models/user_model.dart';
import 'package:ai_connect/features/user/domain/entities/user_entity.dart';
import 'package:ai_connect/features/user/domain/repositories/user_profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final DbDataSource dataSource;

  UserProfileRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, UserEntity>> createUserProfile(
      {required UserEntity user}) async {
    try {
      await dataSource.createUserProfile(user: user);
      return Right(user);
    } on Exception catch (exp) {
      return _catchExceptions(exp);
    }
  }

  dynamic _catchExceptions(Exception exp) {
    if (exp is PostgrestException) {
      return Left(SupabaseExceptionHandler.databaseException(exp));
    }
    return _unknowingExp(msg: exp.toString());
  }

  @override
  Future<Either<Failure, UserEntity>> fetchUserProfile(
      {required String userId}) async {
    try {
      final result = await dataSource.fetchUserProfile(userId: userId);
      if (result.data.isNotEmpty) {
        final user = UserModel.fromMap(result.data[0]);
        return Right(user);
      }
      return _unknowingExp(msg: "user not found");
    } on Exception catch (exp) {
      return _catchExceptions(exp);
    }
  }

  Left<Failure, UserEntity> _unknowingExp({required String msg}) {
    return Left(
      SupabaseExceptionHandler.databaseException(PostgrestException(
        message: msg,
      )),
    );
  }

  @override
  Future<Either<Failure, UserEntity>> updateUserProfile(
      {required UserEntity user}) async {
    try {
      await dataSource.updateUserProfile(user: user);
      return Right(user);
    } on Exception catch (exp) {
      return _catchExceptions(exp);
    }
  }

  @override
  Future<Either<Failure, String>> setUserProfileImg(
      {required File imgFile, required String userName}) async {
    try {
      final imgPath = await dataSource.setUserProfileImg(
          imgFile: imgFile, userName: userName);
      return Right(imgPath);
    } on Exception catch (exp) {
      return _catchExceptions(exp);
    }
  }
}
