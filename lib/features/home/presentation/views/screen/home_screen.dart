import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/core/widgets/bottom_nav_bar.dart';
import 'package:ai_connect/features/home/presentation/views/widgets/ai_tool_box.dart';
import 'package:ai_connect/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:ai_connect/features/home/presentation/views/widgets/questions_history_header.dart';
import 'package:ai_connect/features/home/presentation/views/widgets/questions_history_list.dart';
import 'package:flutter/material.dart';

const title = "This sample of chat ai question This sample of chat ai question";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      extendBody: true,
      body: Padding(
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
                  onTap: () {},
                ),
                AiToolBox(
                  toolCompany: "Google",
                  toolName: "Gemini",
                  imgPath: AppAssetsManager.geminiIcon,
                  onTap: () {},
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
      ),
      bottomNavigationBar: FloatingBottomNavBar(
        currentIndex: currentIndex,
        getCurrentIndex: (int index) {},
      ),
    );
  }
}
