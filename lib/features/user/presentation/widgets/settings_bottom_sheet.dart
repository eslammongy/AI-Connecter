import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/features/user/presentation/widgets/theme_switcher_component.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'chat_font_toggles.dart';

class SettingsBottomSheet extends StatelessWidget {
  const SettingsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          buildSheetHeader(context),
          SizedBox(
            height: 20,
          ),
          const ChatFontStyleToggles(),
          SizedBox(
            height: 20,
          ),
          Text(
            "Theme Mode",
            style: AppTextStyles.styleBold20(context),
          ),
          SizedBox(
            height: 20,
          ),
          ThemeSwitcherComponent()
        ],
      ),
    );
  }

  Row buildSheetHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Settings",
          style: AppTextStyles.styleSemiBold30(context),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
            onTap: () => GoRouter.of(context).pop(),
            child: const Icon(
              FontAwesomeIcons.x,
              color: Colors.red,
              size: 22,
            )),
      ],
    );
  }
}
