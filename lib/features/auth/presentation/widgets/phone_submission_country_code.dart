import 'package:ai_connect/core/constant/app_strings.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/theme/text_style.dart';
import 'package:ai_connect/features/chatting/presentation/views/widgets/custom_text_input_filed.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

typedef SetCountryCode = void Function(String code);

class PhoneSubmissionCountryCode extends StatelessWidget {
  const PhoneSubmissionCountryCode({
    super.key,
    required this.phoneNumController,
    required this.setCountryCode,
  });
  final TextEditingController phoneNumController;
  final SetCountryCode setCountryCode;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Column(
      children: [
        Row(
          children: [
            Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              shape:
                  RoundedRectangleBorder(borderRadius: roundedRectangleBorder),
              child: CountryCodePicker(
                initialSelection: 'EG',
                favorite: const ['+20', 'EG'],
                showCountryOnly: false,
                padding: EdgeInsets.all(10),
                dialogBackgroundColor: theme.appColors.surface,
                showOnlyCountryWhenClosed: false,
                dialogTextStyle: AppTextStyles.styleMedium16(context),
                textStyle: AppTextStyles.styleMedium16(context),
                barrierColor: theme.appColors.surface.withValues(alpha: 0.4),
                alignLeft: false,
                dialogSize: Size(300, 360),
                onChanged: (value) {
                  setCountryCode(value.dialCode!.trim());
                },
              ),
            ),
            Expanded(
              child: CustomTextInputField(
                textEditingController: phoneNumController,
                fieldRoundedRadius: roundedRectangleBorder1,
                hint: AppStrings.signInWithPhoneHint,
                textInputType: TextInputType.phone,
                isTextPassword: false,
                autoFocus: false,
                maxLines: 1,
                prefix: const SizedBox(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  get roundedRectangleBorder => BorderRadius.only(
        bottomLeft: Radius.circular(
          12,
        ),
        topLeft: Radius.circular(12),
      );
  get roundedRectangleBorder1 => BorderRadius.only(
        bottomRight: Radius.circular(
          12,
        ),
        topRight: Radius.circular(12),
      );
}
