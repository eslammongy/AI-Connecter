import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
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

    setExpandedTestLen();
    return Container(
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
              maxLines: 3,
              style: msgTextFont(theme, AppAssetsManager.openSans),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hiddenText ? ('$firstHalf...') : (firstHalf + secondHalf),
                  style: msgTextFont(
                    theme,
                    AppAssetsManager.openSans,
                  ),
                ),
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
                        style: theme.textTheme.bodyLarge
                            ?.copyWith(color: theme.colorScheme.surfaceTint),
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
