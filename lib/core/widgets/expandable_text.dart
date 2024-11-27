import 'package:ai_connect/core/constant/constants.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';

class ExpendableTextWidget extends StatefulWidget {
  final String expendedText;
  final Color textColor;
  const ExpendableTextWidget(
      {super.key, required this.expendedText, required this.textColor});

  @override
  State<ExpendableTextWidget> createState() => _ExpendableTextWidgetState();
}

class _ExpendableTextWidgetState extends State<ExpendableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textLength = 80;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final fontFamily = SettingsBloc.get(context).chattingFont;
    debugPrint("Formatted Font Name: ${fontFamily.fontName}");
    setExpandedTestLen();
    return Container(
      child: secondHalf.isEmpty
          ? Text(firstHalf,
              maxLines: 3,
              style: AppTextStyles.styleBold16(context).copyWith(
                fontFamily: fontFamily.fontName,
              ))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hiddenText ? ('$firstHalf...') : (firstHalf + secondHalf),
                    style: AppTextStyles.styleBold16(context).copyWith(
                      fontFamily: fontFamily.fontName,
                    )),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        hiddenText ? 'Read More..' : 'Show less..',
                        style: AppTextStyles.styleBold16(context)
                            .copyWith(color: theme.appColors.primary),
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up_outlined,
                        color: theme.appColors.tertiary,
                        size: 32,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }

  TextStyle? msgTextFont(ThemeData theme, String font) =>
      theme.textTheme.bodyLarge?.copyWith(
          color: widget.textColor,
          fontFamily: font,
          fontWeight: FontWeight.w600);

  setExpandedTestLen() {
    if (widget.expendedText.length > textLength) {
      firstHalf = widget.expendedText.substring(0, textLength.toInt());
      secondHalf = widget.expendedText
          .substring(textLength.toInt() + 1, widget.expendedText.length);
    } else {
      firstHalf = widget.expendedText;
      secondHalf = '';
    }
  }
}
