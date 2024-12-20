import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class CustomTextInputField extends StatelessWidget {
  const CustomTextInputField({
    super.key,
    required this.textEditingController,
    this.hint,
    this.prefix,
    this.autoFocus = false,
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
    this.isTextPassword = false,
    this.textColor,
    this.suffix,
    this.initText,
    this.height = 55.0,
    this.onSubmitted,
    this.onChange,
    this.bkColor,
    this.focusColor,
    this.enabled = true,
    this.fieldRoundedRadius,
  });

  final TextEditingController textEditingController;
  final String? initText;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType textInputType;
  final bool autoFocus;
  final bool? isTextPassword;
  final int? maxLines;
  final Color? textColor;
  final Function(String?)? onSubmitted;
  final Function(String?)? onChange;
  final double height;
  final Color? bkColor;
  final Color? focusColor;
  final bool enabled;
  final BorderRadius? fieldRoundedRadius;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return SizedBox(
      height: height,
      child: Card(
        color: bkColor ?? theme.appColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: fieldRoundedRadius ?? BorderRadius.circular(12),
        ),
        margin: EdgeInsets.zero,
        elevation: 0,
        child: TextFormField(
          autofocus: autoFocus,
          obscureText: isTextPassword ?? false,
          maxLines: maxLines,
          enabled: enabled,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          controller: textEditingController,
          style:
              AppTextStyles.styleSemiBold18(context).copyWith(color: textColor),
          decoration: InputDecoration(
            hintStyle: AppTextStyles.styleRegular16(context)
                .copyWith(color: theme.appColors.tertiary),
            focusColor: theme.appColors.primary,
            focusedBorder: OutlineInputBorder(
              borderRadius: fieldRoundedRadius ?? BorderRadius.circular(10),
              borderSide: BorderSide(
                color: focusColor ?? theme.appColors.primary,
                width: 1,
              ),
            ),
            isDense: false,
            isCollapsed: true,
            contentPadding: const EdgeInsets.only(
                bottom: 20, top: 16, left: 10.0, right: 10),
            hintText: hint,
            border: InputBorder.none,
            prefixIcon: prefix,
            suffixIcon: suffix,
            prefixIconColor: theme.appColors.tertiary,
          ),
          cursorColor: theme.appColors.primary,
          keyboardType: textInputType,
          onFieldSubmitted: onSubmitted,
          onChanged: onChange,
        ),
      ),
    );
  }
}
