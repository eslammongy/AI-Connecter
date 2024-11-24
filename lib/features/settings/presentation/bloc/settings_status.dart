import 'package:ai_connect/core/constant/constants.dart';
import 'package:equatable/equatable.dart';

abstract class SettingStatus extends Equatable {
  const SettingStatus();

  @override
  List<Object> get props => [];
}

class SettingInitialState extends SettingStatus {}

class SettingKeepLoggedState extends SettingStatus {}

class SettingResetSessionState extends SettingStatus {}

class SettingSwitchThemeState extends SettingStatus {
  final ThemeModes mode;

  const SettingSwitchThemeState({required this.mode});
}

class SettingChangeChattingFontState extends SettingStatus {
  final FontFamily font;
  const SettingChangeChattingFontState({required this.font});
}

class SettingFailureState extends SettingStatus {
  final String? message;
  const SettingFailureState({this.message});
}
