import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class ChatFontStyleToggles extends StatelessWidget {
  const ChatFontStyleToggles({super.key});

  @override
  Widget build(BuildContext context) {
    final msgFont = AppAssetsManager.openSans;
    final theme = Theme.of(context);

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
            _buildChatFontBtn(
              context,
              theme,
              msgFont == AppAssetsManager.openSans,
              AppAssetsManager.openSans,
            ),
            _buildChatFontBtn(
              context,
              theme,
              msgFont == AppAssetsManager.roboto,
              AppAssetsManager.roboto,
            ),
            _buildChatFontBtn(
              context,
              theme,
              msgFont == AppAssetsManager.inter,
              AppAssetsManager.inter,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildChatFontBtn(
              context,
              theme,
              msgFont == AppAssetsManager.sourGummy,
              AppAssetsManager.sourGummy,
            ),
            _buildChatFontBtn(
              context,
              theme,
              msgFont == AppAssetsManager.indieFlower,
              AppAssetsManager.indieFlower,
            ),
            _buildChatFontBtn(
              context,
              theme,
              msgFont == AppAssetsManager.teko,
              AppAssetsManager.teko,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildChatFontBtn(
    BuildContext context,
    ThemeData theme,
    bool isSelected,
    String fontFamily,
  ) {
    final boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      color: isSelected ? theme.appColors.primary : theme.appColors.background,
    );
    return DecoratedBox(
      decoration: boxDecoration,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: SizedBox(
            height: 25,
            width: 110,
            child: Text(
              "sample of text",
              textAlign: TextAlign.center,
              style: AppTextStyles.styleMedium18(context).copyWith(
                fontFamily: fontFamily,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
