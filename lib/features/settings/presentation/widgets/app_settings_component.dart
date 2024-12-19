import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/features/chatting/data/repositories/chatting_repository_impl.dart';
import 'package:ai_connect/features/chatting/domain/entities/message_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'settings_bottom_sheet.dart';

class AppSettingsComponent extends StatelessWidget {
  const AppSettingsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Card(
        color: context.theme.appColors.primary,
        margin: const EdgeInsets.only(right: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
        child: InkWell(
          onTap: () async {
            //_displaySettingSheet(context);
            final chattingRepo = ChattingRepositoryImpl();
            await chattingRepo
                .sendGeminiMessage(
                    msg: MessageEntity(
                        text: "I will send you my CV to analysis it",
                        rule: MsgRules.user.name))
                .then(
              (value) {
                value.fold((res) {
                  debugPrint(
                      "Gemini Response: text:${res.text}:MetaData:${res.usageMetadata}");
                }, (exp) {
                  debugPrint("Gemini Expiation: $exp");
                });
              },
            );
          },
          borderRadius: BorderRadius.circular(100),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              FontAwesomeIcons.gear,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _displaySettingSheet(BuildContext context) async {
    const borderRadius = Radius.circular(20.0);
    final theme = context.theme;

    await showModalBottomSheet(
      context: context,
      backgroundColor: theme.appColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: borderRadius,
          topRight: borderRadius,
        ),
      ),
      builder: (BuildContext context) {
        return const SettingsBottomSheet();
      },
    );
  }
}
