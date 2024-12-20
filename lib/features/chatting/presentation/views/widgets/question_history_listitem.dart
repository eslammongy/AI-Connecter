import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/routes/app_routes.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/core/utils/helper.dart';
import 'package:ai_connect/features/chatting/domain/entities/chat_entity.dart';
import 'package:ai_connect/features/chatting/presentation/views/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const desc =
    "This sample of chat ai question This sample of chat ai question This sample of chat ai questionThis sample of chat ai question This sample of chat ai question This sample of chat ai question";

class QuestionHistoryListItem extends StatelessWidget {
  const QuestionHistoryListItem({
    super.key,
    this.isArchived = false,
    required this.chat,
  });
  final bool isArchived;
  final ChatEntity chat;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(AppRoutes.chattingScreen, extra: chat);
        },
        child: SizedBox(
          height: 150,
          child: Stack(
            children: [
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 70, bottom: 8, top: 5),
                        child: Text(
                          title,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.styleBold20(context).copyWith(
                            fontFamily: AppAssetsManager.inter,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          desc,
                          maxLines: 4,
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
              // Positioned(
              //   top: 4,
              //   right: 10,
              //   child: Card(
              //     color: context.theme.appColors.primary,
              //     elevation: 0,
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(100)),
              //     child: InkWell(
              //       onTap: () {},
              //       borderRadius: BorderRadius.circular(100),
              //       child: Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Icon(
              //           isArchived
              //               ? Icons.unarchive_rounded
              //               : Icons.archive_rounded,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              Positioned(
                bottom: 5,
                right: 10,
                child: Card(
                  elevation: 0,
                  color: context.theme.appColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      dateTimeFormatter(DateTime.now()),
                      textAlign: TextAlign.start,
                      style: AppTextStyles.styleBold16(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
