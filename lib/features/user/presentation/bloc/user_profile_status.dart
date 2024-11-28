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

  const UserProfileCreateState(this.user);
  @override
  List<Object?> get props => [user];
}

class UserProfileUpdateState extends UserProfileStatus {
  final UserEntity user;

  const UserProfileUpdateState(this.user);
  @override
  List<Object?> get props => [user];
}

class UserProfileFetchState extends UserProfileStatus {
  final UserEntity user;

  const UserProfileFetchState(this.user);
  @override
  List<Object?> get props => [user];
}

class UserProfileFailureState extends UserProfileStatus {
  final String? errorMsg;
  const UserProfileFailureState({this.errorMsg});
  @override
  List<Object?> get props => [errorMsg];
}
