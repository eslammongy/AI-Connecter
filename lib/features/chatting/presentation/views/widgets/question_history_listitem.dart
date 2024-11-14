import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/core/utils/app_routes.dart';
import 'package:ai_connect/core/utils/helper.dart';
import 'package:ai_connect/features/chatting/presentation/views/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const desc =
    "This sample of chat ai question This sample of chat ai question This sample of chat ai questionThis sample of chat ai question This sample of chat ai question This sample of chat ai question";

class QuestionHistoryListItem extends StatelessWidget {
  const QuestionHistoryListItem({
    super.key,
    this.isArchived = false,
  });
  final bool isArchived;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () => GoRouter.of(context).pushNamed(
          AppRoutes.chattingScreen,
        ),
        child: SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Stack(
              children: [
                Positioned.fill(
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
                                    width: 1,
                                    color: context.theme.appColors.tertiary)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                dateTimeFormatter(DateTime.now()),
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
                          desc,
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
                Positioned(
                    bottom: 0,
                    right: 10,
                    child: Card(
                      color: context.theme.appColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(100),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(isArchived
                              ? Icons.unarchive_rounded
                              : Icons.archive_rounded),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
