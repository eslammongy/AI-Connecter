import 'package:ai_connect/features/user/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

abstract class AuthStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthStatus {}

class AuthLoadingState extends AuthStatus {}

class AuthAppleSignedState extends AuthStatus {
  final UserEntity user;
  AuthAppleSignedState({
    required this.user,
  });
  @override
  List<Object?> get props => [user];
}

class AuthGoogleSignedState extends AuthStatus {
  final UserEntity user;
  AuthGoogleSignedState({
    required this.user,
  });
  @override
  List<Object?> get props => [user];
}

class AuthPhoneSignedState extends AuthStatus {
  final String phone;
  AuthPhoneSignedState({required this.phone});

  @override
  List<Object?> get props => [phone];
}

class AuthOtpVerifiedState extends AuthStatus {
  final UserEntity user;
  AuthOtpVerifiedState({
    required this.user,
  });
  @override
  List<Object?> get props => [user];
}

class AuthSignOutState extends AuthStatus {}

class AuthKeepUserSignedInState extends AuthStatus {
  final String? token;
  AuthKeepUserSignedInState({this.token});
  @override
  List<Object?> get props => [token];
}

class AuthFailureState extends AuthStatus {
  final String? message;
  AuthFailureState({this.message});

  @override
  List<Object?> get props => [message];
}
