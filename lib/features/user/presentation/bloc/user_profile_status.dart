import 'package:ai_connect/features/user/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

abstract class UserProfileStatus extends Equatable {
  const UserProfileStatus();
  @override
  List<Object?> get props => [];
}

class UserProfileInitialState extends UserProfileStatus {}

class UserProfileLoadingState extends UserProfileStatus {}

class UserProfileCreateState extends UserProfileStatus {
  final UserEntity user;

  const UserProfileCreateState({required this.user});
  @override
  List<Object?> get props => [user];
}

class UserProfileUpdateState extends UserProfileStatus {
  final UserEntity user;

  const UserProfileUpdateState({required this.user});
  @override
  List<Object?> get props => [user];
}

class UserProfileFetchState extends UserProfileStatus {
  final UserEntity user;

  const UserProfileFetchState({required this.user});
  @override
  List<Object?> get props => [user];
}

class UserProfileSetImgState extends UserProfileStatus {}

class UserProfileFailureState extends UserProfileStatus {
  final String? errorMsg;
  const UserProfileFailureState({this.errorMsg});
  @override
  List<Object?> get props => [errorMsg];
}
