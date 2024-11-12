import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/widgets/custom_elevated_btn.dart';
import 'package:ai_connect/features/chatting/presentation/views/widgets/custom_text_input_filed.dart';
import 'package:ai_connect/features/user/presentation/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: kToolbarHeight,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Card(
              color: context.theme.appColors.primary,
              margin: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80),
              ),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(100),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(FontAwesomeIcons.gear),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: kToolbarHeight,
          ),
          Align(
            alignment: Alignment.center,
            child: ProfileImageSection(profileImgUrl: "profileImgUrl"),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextInputField(
            textEditingController: TextEditingController(),
            height: 55,
            hint: "user name",
            enabled: false,
            bkColor: context.theme.appColors.surface,
            focusColor: context.theme.appColors.primary,
            prefix: const Icon(FontAwesomeIcons.userLarge),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextInputField(
            textEditingController: TextEditingController(),
            height: 55,
            hint: "user name",
            enabled: false,
            bkColor: context.theme.appColors.surface,
            focusColor: context.theme.appColors.primary,
            prefix: const Icon(FontAwesomeIcons.solidEnvelope),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextInputField(
            textEditingController: TextEditingController(),
            height: 55,
            hint: "user name",
            enabled: false,
            bkColor: context.theme.appColors.surface,
            focusColor: context.theme.appColors.primary,
            prefix: const Icon(FontAwesomeIcons.phone),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomElevatedBtn(
            text: "Sign out",
            bkColor: context.theme.appColors.error,
            icon: null,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
