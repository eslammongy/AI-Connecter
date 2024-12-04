import 'package:ai_connect/features/user/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

/// Base class for authentication status states.
abstract class AuthStatus extends Equatable {
  final UserEntity? user;
  const AuthStatus({this.user});

  @override
  List<Object?> get props => [user];
}

/// Initial state before any authentication action is performed.
class AuthInitialState extends AuthStatus {
  const AuthInitialState();
}

/// State representing a loading state during an authentication action.
class AuthLoadingState extends AuthStatus {
  const AuthLoadingState();
}

/// State representing a successful Apple sign-in.
class AuthAppleSignedState extends AuthStatus {
  const AuthAppleSignedState({super.user});
}

/// State representing a successful Google sign-in.
class AuthGoogleSignedState extends AuthStatus {
  const AuthGoogleSignedState({super.user});
}

/// State representing a successful Phone sign-in.
class AuthPhoneSignedState extends AuthStatus {
  final String phone;

  const AuthPhoneSignedState({required this.phone}) : super();

  @override
  List<Object?> get props => [phone];
}

/// State representing an OTP verification success.
class AuthOtpVerifiedState extends AuthStatus {
  const AuthOtpVerifiedState({super.user});
}

/// State representing a sign-out event.
class AuthSignOutState extends AuthStatus {
  const AuthSignOutState();
}

/// State representing the "keep signed in" option with a token.
class AuthKeepUserSignedInState extends AuthStatus {
  final String? token;

  const AuthKeepUserSignedInState({this.token}) : super();

  @override
  List<Object?> get props => [user, token];
}

/// State representing an authentication failure.
class AuthFailureState extends AuthStatus {
  final String? message;

  const AuthFailureState({this.message}) : super();

  @override
  List<Object?> get props => [message];
}
