import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/user/domain/repositories/user_profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

class SetUserProfileImgUcase {
  final UserProfileRepository userProfileRepository;
  const SetUserProfileImgUcase({required this.userProfileRepository});

  Future<Either<Failure, String>> call({required XFile imgFile}) =>
      userProfileRepository.setUserProfileImg(
        imgFile: imgFile,
      );
}
