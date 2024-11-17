import 'package:ai_connect/core/constant/app_strings.dart';
import 'package:ai_connect/core/utils/app_storage.dart';
import 'package:flutter/material.dart';

enum ThemeModes { darkTheme, lightTheme }

class ThemeNotifier extends ChangeNotifier {
  ThemeNotifier() {
    getAppPreferenceTheme();
  }

  bool _isDarkTheme = true;

  bool get isDarkTheme => _isDarkTheme;

// Method to toggle theme
  void toggleTheme(ThemeMode mode) {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners(); // Notify all listeners about the change
  }

// Get the current theme
  ThemeMode get themeMode {
    return _isDarkTheme ? ThemeMode.dark : ThemeMode.dark;
  }

  void getAppPreferenceTheme() async {
    final themeMode = await AppStorage.getFromAppStorage(themeModeKey);
    if (themeMode == ThemeModes.darkTheme.name) {
      _isDarkTheme = true;
    } else {
      _isDarkTheme = false;
    }
  }
}
