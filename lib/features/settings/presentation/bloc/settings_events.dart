import 'package:ai_connect/core/constant/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SettingEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class SettingGetAppThemeEvent extends SettingEvents {}

class SettingGetChattingFontEvent extends SettingEvents {}

class SettingSwitchThemeEvent extends SettingEvents {
  final ThemeMode theme;
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
