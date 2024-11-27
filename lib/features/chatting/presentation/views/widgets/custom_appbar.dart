import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/constant/app_strings.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'custom_text_input_filed.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return AppBar(
      backgroundColor: context.theme.appColors.background,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      leadingWidth: 30,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppAssetsManager.aiIMage,
            width: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          index != 0
              ? Expanded(
                  child: CustomTextInputField(
                    textEditingController: searchController,
                    height: 50,
                    hint: "search for city by name...",
                    bkColor: context.theme.appColors.surface,
                    focusColor: context.theme.appColors.primary,
                    prefix: const Icon(FontAwesomeIcons.magnifyingGlass),
                    onSubmitted: (text) {},
                  ),
                )
              : Text(
                  AppStrings.appName,
                  style: AppTextStyles.styleSemiBold24(context).copyWith(
                    fontFamily: AppAssetsManager.inter,
                  ),
                ),
        ],
      ),
      //  actions: index == 1 ? [] : [buildActionButton(context)],
    );
  }

  Card buildActionButton(BuildContext context) {
    return Card(
      color: context.theme.appColors.primary,
      margin: EdgeInsets.only(right: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(AppRoutes.chattingScreen);
        },
        borderRadius: BorderRadius.circular(50),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Transform.scale(
            scale: 1.2,
            child: Icon(
              Icons.add,
              size: 26,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
