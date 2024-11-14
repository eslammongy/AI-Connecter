import 'package:ai_connect/core/constant/fake_json.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/features/chatting/presentation/views/widgets/msg_question_bubble.dart';
import 'package:ai_connect/features/chatting/presentation/views/widgets/question_input_builder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

const title = "This Test Sample Title Chatting Screen more more";

class ChattingScreen extends StatelessWidget {
  const ChattingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.styleBold30(context),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView.builder(
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
}
