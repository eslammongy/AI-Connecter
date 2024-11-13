import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:flutter/material.dart';

enum ThemeMode {
  lightMode,
  darkMode,
}

final selections = {
  ThemeMode.lightMode,
};

class ThemeSwitcherComponent extends StatelessWidget {
  const ThemeSwitcherComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Material(
      color: Colors.transparent,
      child: SegmentedButton<ThemeMode>(
        showSelectedIcon: false,
        style: buildButtonStyle(theme),
        segments: <ButtonSegment<ThemeMode>>[
          ButtonSegment<ThemeMode>(
            value: ThemeMode.lightMode,
            label: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Light Mode',
                style: AppTextStyles.styleBold20(context),
              ),
            ),
            icon: Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.light_mode),
            ),
          ),
          ButtonSegment<ThemeMode>(
            value: ThemeMode.darkMode,
            label: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Dark Mode',
                style: AppTextStyles.styleBold20(context),
              ),
            ),
            icon: Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.dark_mode_rounded),
            ),
          ),
        ],
        selected: <ThemeMode>{ThemeMode.lightMode},
        onSelectionChanged: (Set<ThemeMode> newSelection) {},
        multiSelectionEnabled: false,
      ),
    );
  }

  ButtonStyle buildButtonStyle(ThemeData theme) {
    return ButtonStyle(
      fixedSize: WidgetStateProperty.all<Size>(Size.fromHeight(60.0)),
      side: WidgetStateProperty.resolveWith<BorderSide>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return BorderSide(
              color: theme.appColors.tertiary,
              width: 2.0,
            );
          }
          return BorderSide(
            color: Colors.transparent,
            width: 2.0,
          );
        },
      ),
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return theme.appColors.primary;
          }
          return theme.appColors.background;
        },
      ),
    );
  }
}
