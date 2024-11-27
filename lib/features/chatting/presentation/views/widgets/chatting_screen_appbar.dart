import 'package:ai_connect/core/constant/constants.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/features/chatting/domain/entities/menu_item.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChattingScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ChattingScreenAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      title: Text(title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.styleBold30(context).copyWith(
            fontFamily: SettingsBloc.get(context).chattingFont.fontName,
          )),
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
        Padding(
          padding: EdgeInsets.all(9),
          child: GestureDetector(
            onTapDown: (details) {
              final offset = details.globalPosition;
              final right = MediaQuery.of(context).size.width - offset.dx;
              final bottom = MediaQuery.of(context).size.height - offset.dy;
              buildShowMenu(context, offset, right, bottom);
            },
            child: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Future<MenuItem?> buildShowMenu(
    BuildContext context,
    Offset offset,
    double right,
    double bottom,
  ) {
    return showMenu(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy,
        right,
        bottom,
      ),
      items: menuItems.map(
        (item) {
          return PopupMenuItem<MenuItem>(
            value: item,
            child: ListTile(
              leading: Icon(item.icon),
              title: Text(item.label),
            ),
          );
        },
      ).toList(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
