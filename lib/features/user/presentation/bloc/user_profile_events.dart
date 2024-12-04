import 'dart:io';

import 'package:ai_connect/features/user/domain/entities/user_entity.dart';

abstract class UserProfileEvents {
  const UserProfileEvents();
}

class UserProfileCreateEvent extends UserProfileEvents {
  final UserEntity user;

  UserProfileCreateEvent({required this.user});
}

class UserProfileUpdateEvent extends UserProfileEvents {
  final UserEntity user;

  UserProfileUpdateEvent({required this.user});
}

class UserProfileFetchEvent extends UserProfileEvents {
  final String userId;

  UserProfileFetchEvent({required this.userId});
}

class UserProfileSetImgEvent extends UserProfileEvents {
  final File imgFile;
  final String userName;
  UserProfileSetImgEvent({
    required this.imgFile,
    required this.userName,
  });
}
