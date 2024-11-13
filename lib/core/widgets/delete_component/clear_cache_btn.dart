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
              _displayDeleteConfirmation(context);
            },
            icon: Icon(FontAwesomeIcons.trashCan, color: Colors.white)),
      ],
    );
  }

  Future<void> _displayDeleteConfirmation(
    BuildContext context,
  ) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Theme.of(context).colorScheme.surface.withOpacity(0.6),
      builder: (context) {
        return confirmDeleteAction(context, userLogout: () async {});
      },
    );
  }
}
