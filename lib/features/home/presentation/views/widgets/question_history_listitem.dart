import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/core/utils/helper.dart';
import 'package:ai_connect/features/home/presentation/views/screen/home_screen.dart';
import 'package:flutter/material.dart';

class QuestionHistoryListItem extends StatelessWidget {
  const QuestionHistoryListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title.substring(0, 30),
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: AppTextStyles.styleBold20(context).copyWith(
                      fontFamily: AppAssetsManager.inter,
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                            width: 1, color: context.theme.appColors.tertiary)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        datetimeFormater(DateTime.now()),
                        textAlign: TextAlign.start,
                        style: AppTextStyles.styleSemiBold20(context),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: Text(
                  "This sample of chat ai question This sample of chat ai question This sample of chat ai questionThis sample of chat ai question This sample of chat ai question This sample of chat ai question",
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.styleMedium18(context).copyWith(
                      color: context.theme.appColors.tertiary,
                      fontFamily: AppAssetsManager.inter),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
