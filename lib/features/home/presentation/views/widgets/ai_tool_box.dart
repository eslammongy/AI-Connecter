import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AiToolBox extends StatelessWidget {
  const AiToolBox(
      {super.key,
      required this.toolName,
      required this.toolCompany,
      required this.imgPath,
      this.onTap});
  final String toolName;
  final String toolCompany;
  final String imgPath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 180,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          margin: EdgeInsets.zero,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    imgPath,
                    width: 48,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    toolName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.styleSemiBold24(context)
                        .copyWith(fontFamily: AppAssetsManager.inter),
                  ),
                  Text(
                    toolCompany,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.styleSemiBold18(context).copyWith(
                        color: context.theme.appColors.tertiary,
                        fontFamily: AppAssetsManager.inter),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
