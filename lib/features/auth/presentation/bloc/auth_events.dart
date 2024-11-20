import 'package:equatable/equatable.dart';

abstract class AuthEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthWithGoogleEvent extends AuthEvents {
  AuthWithGoogleEvent();
  @override
  List<Object?> get props => [];
}

class AuthWithAppleEvent extends AuthEvents {
  AuthWithAppleEvent();
  @override
  List<Object?> get props => [];
}

class AuthWithPhoneEvent extends AuthEvents {
  final String phone;
  AuthWithPhoneEvent({required this.phone});
  @override
  List<Object?> get props => [phone];
}

class AuthVerifyPhoneOtpEvent extends AuthEvents {
  final String phone;
  final String otp;
  AuthVerifyPhoneOtpEvent({required this.phone, required this.otp});
  @override
  List<Object?> get props => [phone, otp];
}

class AuthFetchUserEvent extends AuthEvents {
  final String userId;
  AuthFetchUserEvent({required this.userId});
  @override
  List<Object?> get props => [userId];
}

class AuthUpdateUserEvent extends AuthEvents {
  final String userId;
  final Map<String, dynamic> data;
  AuthUpdateUserEvent({
    required this.userId,
    required this.data,
  });
  @override
  List<Object?> get props => [userId, data];
}

class AuthSignOutEvent extends AuthEvents {}
