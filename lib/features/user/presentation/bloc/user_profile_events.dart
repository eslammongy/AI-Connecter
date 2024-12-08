import 'dart:io';

import 'package:ai_connect/features/user/domain/entities/user_entity.dart';

abstract class UserProfileEvents {
  const UserProfileEvents();
}

class UserProfileCreateEvent extends UserProfileEvents {
  final UserEntity user;

  const UserProfileCreateEvent({required this.user});
}

class UserProfileUpdateEvent extends UserProfileEvents {
  final UserEntity user;

  const UserProfileUpdateEvent({required this.user});
}

class UserProfileFetchEvent extends UserProfileEvents {
  const UserProfileFetchEvent();
}

class UserProfileSetImgEvent extends UserProfileEvents {
  final File imgFile;
  final String userName;
  const UserProfileSetImgEvent({
    required this.imgFile,
    required this.userName,
  });
}
