import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/constant/constants.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_status.dart';
import 'package:ai_connect/features/settings/presentation/widgets/font_style_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatFontStyleToggles extends StatelessWidget {
  const ChatFontStyleToggles({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsBloc = SettingsBloc.get(context);
    final theme = Theme.of(context);

    return BlocBuilder<SettingsBloc, SettingStatus>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Badge(
              alignment: Alignment.centerRight,
              offset: Offset(22, -6),
              backgroundColor: Colors.transparent,
              label: Icon(
                Icons.circle,
                color: theme.appColors.primary,
                size: 20,
              ),
              child: Text(
                "Chat Font Style",
                style: AppTextStyles.styleBold20(context),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FontStyleBadge(
                  fontFamily: AppAssetsManager.openSans,
                  isSelected: settingsBloc.chattingFont == FontFamily.openSans,
                ),
                FontStyleBadge(
                  fontFamily: AppAssetsManager.roboto,
                  isSelected: settingsBloc.chattingFont == FontFamily.roboto,
                ),
                FontStyleBadge(
                  fontFamily: AppAssetsManager.inter,
                  isSelected: settingsBloc.chattingFont == FontFamily.inter,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FontStyleBadge(
                  fontFamily: AppAssetsManager.chakraPetch,
                  isSelected:
                      settingsBloc.chattingFont == FontFamily.chakraPetch,
                ),
                FontStyleBadge(
                  fontFamily: AppAssetsManager.indieFlower,
                  isSelected:
                      settingsBloc.chattingFont == FontFamily.indieFlower,
                ),
                FontStyleBadge(
                  fontFamily: AppAssetsManager.teko,
                  isSelected: settingsBloc.chattingFont == FontFamily.teko,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
