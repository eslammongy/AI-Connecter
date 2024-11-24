import 'package:ai_connect/core/constant/constants.dart';
import 'package:equatable/equatable.dart';

abstract class SettingEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class SettingKeepUserLoggedEvent extends SettingEvents {
  final String token;
  SettingKeepUserLoggedEvent({required this.token});

  @override
  List<Object?> get props => [token];
}

class SettingResetUserSessionEvent extends SettingEvents {}

class SettingSwitchThemeEvent extends SettingEvents {
  final ThemeModes theme;
  SettingSwitchThemeEvent({required this.theme});
  @override
  List<Object?> get props => [theme];
}

class SettingChangeChattingFontEvent extends SettingEvents {
  final FontFamily font;
  SettingChangeChattingFontEvent({required this.font});
  @override
  List<Object?> get props => [font];
}