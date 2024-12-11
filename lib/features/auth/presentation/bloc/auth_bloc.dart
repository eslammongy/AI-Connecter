import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/auth/domain/usecases/auth_with_apple_ucase.dart';
import 'package:ai_connect/features/auth/domain/usecases/auth_with_google_ucase.dart';
import 'package:ai_connect/features/auth/domain/usecases/auth_with_phone_ucase.dart';
import 'package:ai_connect/features/auth/domain/usecases/keep_user_logged_uc.dart';
import 'package:ai_connect/features/auth/domain/usecases/sign_out_ucase.dart';
import 'package:ai_connect/features/auth/domain/usecases/verify_phone_otp_ucase.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_events.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStatus> {
  static AuthBloc get(context) => BlocProvider.of(context);
  final AuthWithAppleUCase authWithAppleUCase;
  final AuthWithGoogleUCase authWithGoogleUCase;
  final AuthWithPhoneUCase authWithPhoneUCase;
  final VerifyPhoneOtpUCase verifyPhoneOtpUCase;
  final KeepUserSignedInUCase keepUserSignedInUCase;
  final SignOutUCase signOutUCase;

  bool isUserSigned = false;

  AuthBloc({
    required this.authWithAppleUCase,
    required this.authWithGoogleUCase,
    required this.authWithPhoneUCase,
    required this.verifyPhoneOtpUCase,
    required this.keepUserSignedInUCase,
    required this.signOutUCase,
  }) : super(AuthInitialState()) {
    on<AuthWithGoogleEvent>(onAuthWithGoogleEvent);
    on<AuthWithAppleEvent>(onAuthWithAppleEvent);
    on<AuthWithPhoneEvent>(onAuthWithPhoneEvent);
    on<AuthVerifyPhoneOtpEvent>(onOtpVerificationEvent);
    on<AuthKeepUserSignedInEvent>(onKeepUserSignedIn);
    on<AuthSignOutEvent>(onSignOutEvent);
  }

  onAuthWithGoogleEvent(
    AuthWithGoogleEvent event,
    Emitter<AuthStatus> emit,
  ) async {
    emit(AuthLoadingState());
    final result = await authWithGoogleUCase.call();
    result.fold(
      (errMessage) {
        emit(AuthFailureState(message: errMessage.message));
      },
      (signedUser) {
        emit(AuthGoogleSignedState(
          user: signedUser,
        ));
      },
    );
  }

  onAuthWithAppleEvent(
    AuthWithAppleEvent event,
    Emitter<AuthStatus> emit,
  ) async {
    emit(AuthLoadingState());
    final result = await authWithAppleUCase.call();
    result.fold(
      (errMessage) {
        emit(AuthFailureState(message: errMessage.message));
      },
      (signedUser) {
        emit(AuthAppleSignedState(user: signedUser));
      },
    );
  }

  onAuthWithPhoneEvent(
    AuthWithPhoneEvent event,
    Emitter<AuthStatus> emit,
  ) async {
    emit(AuthLoadingState());
    final phoneNum = event.phone.substring(1, event.phone.length);
    final result = await authWithPhoneUCase.call(phone: phoneNum);
    result.fold(
      (errMessage) {
        emit(AuthFailureState(message: errMessage.message));
      },
      (_) {
        emit(AuthPhoneSignedState(phone: phoneNum));
      },
    );
  }

  onOtpVerificationEvent(
    AuthVerifyPhoneOtpEvent event,
    Emitter<AuthStatus> emit,
  ) async {
    emit(AuthLoadingState());
    final phone = event.phone.trim();
    final otp = event.otp.trim();
    final result = await verifyPhoneOtpUCase.call(phone: phone, otp: otp);
    result.fold(
      (errMessage) {
        emit(AuthFailureState(message: errMessage.message));
      },
      (signedUser) {
        emit(AuthOtpVerifiedState(user: signedUser));
      },
    );
  }

  onKeepUserSignedIn(
    AuthKeepUserSignedInEvent event,
    Emitter<AuthStatus> emit,
  ) async {
    final result = await keepUserSignedInUCase.call(value: event.token);
    result.fold((exception) {
      final error = LocalFailure.handleError(exception);
      emit(AuthFailureState(message: error.message));
    }, (token) {
      if (token == null) return;
      emit(AuthKeepUserSignedInState(token: token));
    });
  }

  onSignOutEvent(
    AuthSignOutEvent event,
    Emitter<AuthStatus> emit,
  ) async {
    emit(AuthLoadingState());
    final result = await signOutUCase.call();
    result.fold(
      (errMessage) {
        emit(AuthFailureState(message: errMessage.message));
      },
      (_) {
        emit(AuthSignOutState());
      },
    );
  }
}
