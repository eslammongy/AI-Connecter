import 'package:ai_connect/features/auth/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

abstract class AuthStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthStatusInitial extends AuthStatus {}

class AuthStatusLoading extends AuthStatus {}

class AuthStatusAppleSignedSuccess extends AuthStatus {
  final UserEntity user;
  AuthStatusAppleSignedSuccess({required this.user});

  @override
  List<Object?> get props => [user];
}

class AuthStatusGoogleSignedSuccess extends AuthStatus {
  final UserEntity user;
  AuthStatusGoogleSignedSuccess({required this.user});
  @override
  List<Object?> get props => [user];
}

class AuthStatusPhoneSignedSuccess extends AuthStatus {
  final String phone;

  AuthStatusPhoneSignedSuccess({required this.phone});
}

class AuthStatusOtpVerifiedSuccess extends AuthStatus {
  final UserEntity user;
  AuthStatusOtpVerifiedSuccess({required this.user});
  @override
  List<Object?> get props => [user];
}

class AuthStatusSignOut extends AuthStatus {}

class AuthStatusFailure extends AuthStatus {
  final String? message;
  AuthStatusFailure({this.message});
}
