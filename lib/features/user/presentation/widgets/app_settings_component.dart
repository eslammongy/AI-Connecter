import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'settings_bottom_sheet.dart';

class AppSettingsComponent extends StatelessWidget {
  const AppSettingsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Card(
        color: context.theme.appColors.primary,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
        child: InkWell(
          onTap: () {
            _displaySettingSheet(context);
          },
          borderRadius: BorderRadius.circular(100),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(FontAwesomeIcons.gear),
          ),
        ),
      ),
    );
  }

  Future<void> _displaySettingSheet(BuildContext context) async {
    const borderRadius = Radius.circular(20.0);
    final theme = context.theme;

    await showModalBottomSheet(
      context: context,
      backgroundColor: theme.appColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: borderRadius,
          topRight: borderRadius,
        ),
      ),
      builder: (BuildContext context) {
        return const SettingsBottomSheet();
      },
    );
  }
}
