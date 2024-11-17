import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/core/utils/app_routes.dart';
import 'package:ai_connect/features/chatting/presentation/views/widgets/ai_tool_box.dart';
import 'package:ai_connect/features/chatting/presentation/views/widgets/questions_history_header.dart';
import 'package:ai_connect/features/chatting/presentation/views/widgets/questions_history_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const title = "This sample of chat ai question This sample of chat ai question";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Start Chatting With",
            style: AppTextStyles.styleBold30(context).copyWith(
              fontFamily: AppAssetsManager.inter,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AiToolBox(
                toolCompany: "Open AI",
                toolName: "Chat GPT",
                imgPath: AppAssetsManager.chatGptIcon,
                onTap: () =>
                    GoRouter.of(context).push(AppRoutes.chattingScreen),
              ),
              AiToolBox(
                toolCompany: "Google",
                toolName: "Gemini",
                imgPath: AppAssetsManager.geminiIcon,
                onTap: () =>
                    GoRouter.of(context).push(AppRoutes.chattingScreen),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          QuestionsHistoryHeader(),
          const SizedBox(
            height: 20,
          ),
          QuestionsHistoryList()
        ],
      ),
    );
  }
}
