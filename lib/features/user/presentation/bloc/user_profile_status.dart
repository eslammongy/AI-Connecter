import 'package:ai_connect/features/user/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

abstract class UserProfileStatus extends Equatable {
  final String? errorMsg;
  final UserEntity? user;
  const UserProfileStatus({this.errorMsg, this.user});
  @override
  List<Object?> get props => [errorMsg, user];
}

class UserProfileInitialState extends UserProfileStatus {}

class UserProfileLoadingState extends UserProfileStatus {}

class UserProfileCreateState extends UserProfileStatus {
  const UserProfileCreateState({required UserEntity user}) : super(user: user);
  @override
  List<Object?> get props => [user];
}

class UserProfileUpdateState extends UserProfileStatus {
  const UserProfileUpdateState({required UserEntity user}) : super(user: user);
  @override
  List<Object?> get props => [user];
}

class UserProfileFetchState extends UserProfileStatus {
  const UserProfileFetchState({required UserEntity user}) : super(user: user);
  @override
  List<Object?> get props => [user];
}

class UserProfileSetImgState extends UserProfileStatus {
  final String imgUrl;

  const UserProfileSetImgState({required this.imgUrl});
  @override
  List<Object?> get props => [imgUrl];
}

class UserProfileFailureState extends UserProfileStatus {
  const UserProfileFailureState({super.errorMsg});
  @override
  List<Object?> get props => [errorMsg];
}
