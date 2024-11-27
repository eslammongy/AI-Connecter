import 'package:ai_connect/core/constant/constants.dart';
import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/settings/domain/usecases/change_chatting_font_uc.dart';
import 'package:ai_connect/features/settings/domain/usecases/get_app_theme_uc.dart';
import 'package:ai_connect/features/settings/domain/usecases/get_chatting_font_uc.dart';
import 'package:ai_connect/features/settings/domain/usecases/set_app_theme_uc.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_events.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBloc extends Bloc<SettingEvents, SettingStatus> {
  final SetAppThemeUCase switchAppThemeUCase;
  final ChangeChattingFontUCase changeChattingFontUCase;

  static SettingsBloc get(context) => BlocProvider.of(context);
  SettingsBloc({
    required this.switchAppThemeUCase,
    required this.changeChattingFontUCase,
  }) : super(SettingInitialState()) {
    on<SettingSwitchThemeEvent>(onSwitchAppTheme);
    on<SettingChangeChattingFontEvent>(onChangeChattingFont);
    on<SettingGetAppThemeEvent>(onGetAppTheme);
    on<SettingGetChattingFontEvent>(onGetChattingFont);
  }

  FontFamily chattingFont = FontFamily.inter;
  ThemeMode theme = ThemeMode.dark;
  int indexOfCurrScreen = 0;

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
      emit(SettingChangeChattingFontState(font: chattingFont = font));
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
      emit(SettingChangeChattingFontState(font: chattingFont = font));
    });
  }
}
