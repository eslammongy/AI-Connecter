import 'dart:io';

import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/user/domain/repositories/user_profile_repository.dart';
import 'package:dartz/dartz.dart';

class SetUserProfileImgUcase {
  final UserProfileRepository userProfileRepository;
  const SetUserProfileImgUcase({required this.userProfileRepository});

  Future<Either<Failure, String>> call({
    required File imgFile,
  }) =>
      userProfileRepository.setUserProfileImg(imgFile: imgFile);
}
