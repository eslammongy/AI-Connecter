import 'package:ai_connect/features/auth/domain/usecases/auth_with_apple_ucase.dart';
import 'package:ai_connect/features/auth/domain/usecases/auth_with_google_ucase.dart';
import 'package:ai_connect/features/auth/domain/usecases/auth_with_phone_ucase.dart';
import 'package:ai_connect/features/auth/domain/usecases/sign_out_ucase.dart';
import 'package:ai_connect/features/auth/domain/usecases/verify_phone_otp_ucase.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_status.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_events.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStatus> {
  static AuthBloc get(context) => BlocProvider.of(context);
  final AuthWithAppleUCase authWithAppleUCase;
  final AuthWithGoogleUCase authWithGoogleUCase;
  final AuthWithPhoneUCase authWithPhoneUCase;
  final VerifyPhoneOtpUCase verifyPhoneOtpUCase;
  final SignOutUCase signOutUCase;
  AuthBloc({
    required this.authWithAppleUCase,
    required this.authWithGoogleUCase,
    required this.authWithPhoneUCase,
    required this.verifyPhoneOtpUCase,
    required this.signOutUCase,
  }) : super(AuthStatusInitial()) {
    on<AuthWithGoogleEvent>(onAuthWithGoogleEvent);
    on<AuthWithAppleEvent>(onAuthWithAppleEvent);
    on<AuthWithPhoneEvent>(onAuthWithPhoneEvent);
    on<AuthVerifyPhoneOtpEvent>(onOtpVerificationEvent);
    on<AuthSignOutEvent>(onSignOutEvent);
  }

  onAuthWithGoogleEvent(
    AuthWithGoogleEvent event,
    Emitter<AuthStatus> emit,
  ) async {
    emit(AuthStatusLoading());
    final result = await authWithGoogleUCase.call();
    result.fold(
      (errMessage) {
        emit(AuthStatusFailure(message: errMessage.message));
      },
      (signedUser) {
        emit(AuthStatusGoogleSignedSuccess(user: signedUser));
      },
    );
  }

  onAuthWithAppleEvent(
    AuthWithAppleEvent event,
    Emitter<AuthStatus> emit,
  ) async {
    emit(AuthStatusLoading());
    final result = await authWithAppleUCase.call();
    result.fold(
      (errMessage) {
        emit(AuthStatusFailure(message: errMessage.message));
      },
      (signedUser) {
        emit(AuthStatusAppleSignedSuccess(user: signedUser));
      },
    );
  }

  onAuthWithPhoneEvent(
    AuthWithPhoneEvent event,
    Emitter<AuthStatus> emit,
  ) async {
    emit(AuthStatusLoading());
    final phoneNum = event.phone.substring(1, event.phone.length);
    debugPrint("Phone::$phoneNum");
    final result = await authWithPhoneUCase.call(phone: phoneNum);
    result.fold(
      (errMessage) {
        emit(AuthStatusFailure(message: errMessage.message));
      },
      (_) {
        emit(AuthStatusPhoneSignedSuccess(phone: phoneNum));
      },
    );
  }

  onOtpVerificationEvent(
    AuthVerifyPhoneOtpEvent event,
    Emitter<AuthStatus> emit,
  ) async {
    emit(AuthStatusLoading());
    final phone = event.phone.trim();
    final otp = event.otp.trim();
    final result = await verifyPhoneOtpUCase.call(phone: phone, otp: otp);
    result.fold(
      (errMessage) {
        emit(AuthStatusFailure(message: errMessage.message));
      },
      (signedUser) {
        emit(AuthStatusOtpVerifiedSuccess(user: signedUser));
      },
    );
  }

  onSignOutEvent(
    AuthSignOutEvent event,
    Emitter<AuthStatus> emit,
  ) async {
    emit(AuthStatusLoading());
    final result = await signOutUCase.call();
    result.fold(
      (errMessage) {
        emit(AuthStatusFailure(message: errMessage.message));
      },
      (state) {
        emit(AuthStatusSignOut());
      },
    );
  }
}
