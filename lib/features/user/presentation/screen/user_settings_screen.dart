import 'package:ai_connect/features/user/presentation/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: kToolbarHeight + 60,
        ),
        Align(
            alignment: Alignment.center,
            child: ProfileImageSection(profileImgUrl: "profileImgUrl"))
      ],
    );
  }
}
