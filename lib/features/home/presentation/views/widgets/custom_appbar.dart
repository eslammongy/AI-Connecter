import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/constant/app_strings.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.appColors.background,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
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
          Text(
            AppStrings.appName,
            style: AppTextStyles.styleSemiBold24(context).copyWith(
              fontFamily: AppAssetsManager.inter,
            ),
          ),
        ],
      ),
      actions: [
        Card(
          color: context.theme.appColors.primary,
          margin: EdgeInsets.only(right: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(50),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Transform.scale(
                scale: 1.2,
                child: Icon(
                  Icons.add,
                  size: 26,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
