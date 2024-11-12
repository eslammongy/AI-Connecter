import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class QuestionsHistoryHeader extends StatelessWidget {
  const QuestionsHistoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "History",
          style: AppTextStyles.styleBold30(context).copyWith(
            fontFamily: AppAssetsManager.inter,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Icon(
          Icons.history,
          color: context.theme.appColors.tertiary,
        ),
        Spacer(),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text(
                  "See All",
                  style: AppTextStyles.styleMedium18(context).copyWith(
                    fontFamily: AppAssetsManager.inter,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: context.theme.appColors.tertiary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
