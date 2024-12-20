import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'confirm_delete_action.dart';

class DeleteComponent extends StatelessWidget {
  const DeleteComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Delete All Chat History",
          style: AppTextStyles.styleBold20(context),
        ),
        SizedBox(width: 10),
        IconButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(12),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    width: 2,
                    color: context.theme.appColors.error,
                  )),
            ),
            onPressed: () {
              displayConfirmationActionDialog(context, onConfirm: () {});
            },
            icon: Icon(
              FontAwesomeIcons.trashCan,
            )),
      ],
    );
  }
}
