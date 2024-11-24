abstract class AppConstants {
  static const String themeModeKey = 'THEME_MODE_KEY';
  static const String selectedFontKey = 'SELECTED_FONT_KEY';
  static const String googleWebClientId = 'GOOGLE_WEB_CLIENT_ID';
  static const String appleWebClientId = 'GOOGLE_IOS_CLIENT_ID';
  static const String keepUserLoggedKey = 'KEEP_USER_LOGGED_KEY';
  static const String userTokenKey = 'USER_TOKEN_KEY';
  static const String selectedChattingFontKey = 'SELECTED_CHATTING_FONT_KEY';
  static const String selectedThemeModeKey = 'SELECTED_THEME_MODE_KEY';
}

enum ThemeModes { darkTheme, lightTheme }

extension ThemeModesExtension on ThemeModes {
  String get value => name.replaceAll('ThemeModes.', '');
}

enum FontFamily {
  chakraPetch,
  indieFlower,
  inter,
  openSans,
  roboto,
  sourGummy,
  teko
}

extension FontFamilyExtension on FontFamily {
  String get value => name.replaceAll('FontFamily.', '');
}
