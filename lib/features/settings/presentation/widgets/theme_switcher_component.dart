import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_events.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ThemeSwitcherComponent extends StatelessWidget {
  const ThemeSwitcherComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsBloc = SettingsBloc.get(context);
    return BlocBuilder<SettingsBloc, SettingStatus>(
      builder: (context, state) {
        final theme = context.theme;
        return Material(
          color: Colors.transparent,
          child: SegmentedButton<ThemeMode>(
            showSelectedIcon: false,
            style: buildButtonStyle(context, theme),
            segments: <ButtonSegment<ThemeMode>>[
              buildButtonSegment(
                context,
                'Light Mode',
                ThemeMode.light,
                isActive: settingsBloc.theme == ThemeMode.light,
              ),
              buildButtonSegment(
                context,
                'Dark Mode',
                ThemeMode.dark,
                isActive: settingsBloc.theme == ThemeMode.dark,
              ),
            ],
            selected: <ThemeMode>{settingsBloc.theme},
            onSelectionChanged: (Set<ThemeMode> selection) {
              settingsBloc.add(
                SettingSwitchThemeEvent(theme: selection.first),
              );
              GoRouter.of(context).pop();
            },
            multiSelectionEnabled: false,
          ),
        );
      },
    );
  }

  ButtonSegment<ThemeMode> buildButtonSegment(
    BuildContext context,
    String label,
    ThemeMode value, {
    bool isActive = false,
  }) {
    return ButtonSegment<ThemeMode>(
      value: value,
      label: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          label,
          style: AppTextStyles.styleBold20(
            context,
          ).copyWith(
            color: isActive ? Colors.white : context.theme.appColors.onSurface,
          ),
        ),
      ),
      icon: Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: Icon(
          Icons.light_mode,
          color: isActive ? Colors.white : context.theme.appColors.onSurface,
        ),
      ),
    );
  }

  ButtonStyle buildButtonStyle(BuildContext context, ThemeData theme) {
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
