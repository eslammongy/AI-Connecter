import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/settings/domain/usecases/change_chatting_font_uc.dart';
import 'package:ai_connect/features/settings/domain/usecases/keep_user_logged_uc.dart';
import 'package:ai_connect/features/settings/domain/usecases/reset_user_session_uc.dart';
import 'package:ai_connect/features/settings/domain/usecases/switch_app_theme_uc.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_events.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBloc extends Bloc<SettingEvents, SettingStatus> {
  final KeepUserLoggedUCase keepUserLoggedUCase;
  final SwitchAppThemeUCase switchAppThemeUCase;
  final ChangeChattingFontUCase changeChattingFontUCase;
  final ResetUserSessionUCase resetUserSessionUCase;

  SettingsBloc({
    required this.keepUserLoggedUCase,
    required this.switchAppThemeUCase,
    required this.changeChattingFontUCase,
    required this.resetUserSessionUCase,
  }) : super(SettingInitialState()) {}

  onKeepUserLogged(
    SettingKeepUserLoggedEvent event,
    Emitter<SettingStatus> emit,
  ) async {
    final result = await keepUserLoggedUCase.call(value: event.token);
    result.fold((exception) {
      final error = LocalFailure.handleError(exception);
      emit(SettingFailureState(message: error.message));
    }, (_) {
      emit(SettingKeepLoggedState());
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
    final result = await switchAppThemeUCase.call(mode: event.theme);
    result.fold((exception) {
      final error = LocalFailure.handleError(exception);
      emit(SettingFailureState(message: error.message));
    }, (theme) {
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
}
