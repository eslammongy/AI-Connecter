import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/constant/app_strings.dart';
import 'package:ai_connect/core/constant/fake_json.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/features/chatting/domain/entities/chat_entity.dart';
import 'package:ai_connect/features/chatting/presentation/views/widgets/chatting_screen_appbar.dart';
import 'package:ai_connect/features/chatting/presentation/views/widgets/msg_question_bubble.dart';
import 'package:ai_connect/features/chatting/presentation/views/widgets/question_input_builder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const title = "This Test Sample Title Chatting Screen more more";

class ChattingScreen extends StatelessWidget {
  const ChattingScreen({super.key, this.chatEntity});
  final ChatEntity? chatEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChattingScreenAppBar(title: title),
      body: chatEntity == null
          ? buildBlankWidget(context)
          : ListView.builder(
              padding: EdgeInsets.only(bottom: 10, left: 15, right: 15),
              physics: const BouncingScrollPhysics(),
              itemCount: listOfQuestions.length,
              itemBuilder: (context, index) {
                return MsgQuestionBubble(
                  msgEntity: listOfQuestions[index],
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
        child: Row(
          children: [
            QuestionInputBuilder(questionController: TextEditingController()),
            Card(
              color: context.theme.appColors.primary,
              margin: EdgeInsets.only(left: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              child: InkWell(
                onTap: () async {},
                borderRadius: BorderRadius.circular(100),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    FontAwesomeIcons.paperPlane,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center buildBlankWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppAssetsManager.softwareAgent,
            width: 220,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            AppStrings.chattingScreenBlankMsg,
            textAlign: TextAlign.center,
            style: AppTextStyles.styleBold30(context),
          ),
        ],
      ),
    );
  }
}
