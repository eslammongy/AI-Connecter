import 'package:ai_connect/core/constant/constants.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_events.dart';
import 'package:flutter/material.dart';

class FontStyleBadge extends StatelessWidget {
  const FontStyleBadge({
    super.key,
    required this.isSelected,
    required this.fontFamily,
  });
  final bool isSelected;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    final settingsBloc = SettingsBloc.get(context);
    final theme = context.theme;
    return DecoratedBox(
      decoration: boxDecoration(theme),
      child: InkWell(
        onTap: () {
          final font = toLowerCaseFirstLetter(fontFamily);
          final selectedFont = FontFamily.values.byName(font);
          settingsBloc.add(SettingChangeChattingFontEvent(font: selectedFont));
        },
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: SizedBox(
            height: 25,
            child: Text(
              "sample of text",
              textAlign: TextAlign.center,
              style: AppTextStyles.styleMedium18(context).copyWith(
                fontFamily: fontFamily,
                color: isSelected ? Colors.white : theme.appColors.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }

  String toLowerCaseFirstLetter(String input) {
    if (input.isEmpty) return input; // Return as-is if the string is empty.
    return input[0].toLowerCase() + input.substring(1);
  }

  BoxDecoration boxDecoration(ThemeData theme) => BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color:
            isSelected ? theme.appColors.primary : theme.appColors.background,
      );
}
