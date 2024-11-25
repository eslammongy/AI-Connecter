import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/settings/domain/usecases/change_chatting_font_uc.dart';
import 'package:ai_connect/features/settings/domain/usecases/check_is_user_signed.dart';
import 'package:ai_connect/features/settings/domain/usecases/get_app_theme_uc.dart';
import 'package:ai_connect/features/settings/domain/usecases/get_chatting_font_uc.dart';
import 'package:ai_connect/features/settings/domain/usecases/keep_user_logged_uc.dart';
import 'package:ai_connect/features/settings/domain/usecases/reset_user_session_uc.dart';
import 'package:ai_connect/features/settings/domain/usecases/set_app_theme_uc.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_events.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBloc extends Bloc<SettingEvents, SettingStatus> {
  final KeepUserLoggedUCase keepUserLoggedUCase;
  final SetAppThemeUCase switchAppThemeUCase;
  final ChangeChattingFontUCase changeChattingFontUCase;
  final ResetUserSessionUCase resetUserSessionUCase;

  static SettingsBloc get(context) => BlocProvider.of(context);
  SettingsBloc({
    required this.keepUserLoggedUCase,
    required this.switchAppThemeUCase,
    required this.changeChattingFontUCase,
    required this.resetUserSessionUCase,
  }) : super(SettingInitialState()) {
    on<SettingKeepUserLoggedEvent>(onKeepUserLogged);
    on<SettingResetUserSessionEvent>(onResetUserSession);
    on<SettingSwitchThemeEvent>(onSwitchAppTheme);
    on<SettingChangeChattingFontEvent>(onChangeChattingFont);
    on<SettingGetAppThemeEvent>(onGetAppTheme);
    on<SettingGetChattingFontEvent>(onGetChattingFont);
    on<SettingCheckIsUserSignedEvent>(onCheckIsUserSignedIn);
  }

  String chattingFont = AppAssetsManager.inter;
  ThemeMode theme = ThemeMode.dark;
  bool isUserSigned = false;

  onKeepUserLogged(
    SettingKeepUserLoggedEvent event,
    Emitter<SettingStatus> emit,
  ) async {
    final result = await keepUserLoggedUCase.call(value: event.token);
    result.fold((exception) {
      final error = LocalFailure.handleError(exception);
      emit(SettingFailureState(message: error.message));
    }, (isUserSigned) {
      emit(SettingKeepLoggedState(
        isUserSigned: this.isUserSigned = isUserSigned,
      ));
    });
  }

  onResetUserSession(
    SettingResetUserSessionEvent event,
    Emitter<SettingStatus> emit,
  ) async {
    final result = await resetUserSessionUCase.call();
    result.fold((exception) {
      final error = LocalFailure.handleError(exception);
      emit(SettingFailureState(message: error.message));
    }, (_) {
      emit(SettingResetSessionState());
    });
  }

  onSwitchAppTheme(
    SettingSwitchThemeEvent event,
    Emitter<SettingStatus> emit,
  ) async {
    theme = event.theme;
    final result = await switchAppThemeUCase.call(mode: event.theme);
    result.fold((exception) {
      final error = LocalFailure.handleError(exception);
      emit(SettingFailureState(message: error.message));
    }, (themMode) {
      debugPrint("Selected: ${theme.name}");
      emit(SettingSwitchThemeState(mode: theme));
    });
  }

  onChangeChattingFont(
    SettingChangeChattingFontEvent event,
    Emitter<SettingStatus> emit,
  ) async {
    final result = await changeChattingFontUCase.call(font: event.font);
    result.fold((exception) {
      final error = LocalFailure.handleError(exception);
      emit(SettingFailureState(message: error.message));
    }, (font) {
      emit(SettingChangeChattingFontState(font: font));
    });
  }

  onGetAppTheme(
    SettingGetAppThemeEvent event,
    Emitter<SettingStatus> emit,
  ) async {
    debugPrint("Selected: The Function get Called");
    final result = await GetAppThemeUCase.call();
    result.fold((exception) {
      final error = LocalFailure.handleError(exception);
      emit(SettingFailureState(message: error.message));
    }, (theme) {
      this.theme = ThemeMode.values.byName(theme.name);

      debugPrint("Selected: ${this.theme.name}");
      emit(SettingSwitchThemeState(mode: theme));
    });
  }

  onGetChattingFont(
    SettingGetChattingFontEvent event,
    Emitter<SettingStatus> emit,
  ) async {
    final result = await GetChattingFontUCase.call();
    result.fold((exception) {
      final error = LocalFailure.handleError(exception);
      emit(SettingFailureState(message: error.message));
    }, (font) {
      emit(SettingChangeChattingFontState(font: font));
    });
  }

  onCheckIsUserSignedIn(
    SettingCheckIsUserSignedEvent event,
    Emitter<SettingStatus> emit,
  ) async {
    final result = await CheckIsUserSignedUCase.call();
    result.fold((exception) {
      final error = LocalFailure.handleError(exception);
      emit(SettingFailureState(message: error.message));
    }, (isUserSigned) {
      debugPrint("isUserSigned: $isUserSigned");
      emit(
        SettingKeepLoggedState(
          isUserSigned: this.isUserSigned = isUserSigned,
        ),
      );
    });
  }
}
