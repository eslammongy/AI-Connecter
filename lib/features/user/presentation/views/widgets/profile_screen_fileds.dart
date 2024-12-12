import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/features/auth/presentation/widgets/profile_image_widget.dart';
import 'package:ai_connect/features/chatting/presentation/views/widgets/custom_text_input_filed.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_bloc.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_events.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreenChangeableComponent extends StatelessWidget {
  const ProfileScreenChangeableComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final userNameField = TextEditingController();
    final userPhoneField = TextEditingController();
    final userEmailField = TextEditingController();
    final userBloc = UserProfileBloc.get(context);
    return BlocConsumer<UserProfileBloc, UserProfileStatus>(
      listener: (context, state) {
        if (state is UserProfileFetchState || state is UserProfileUpdateState) {
          updateProfileFields(
            userBloc,
            state,
            userNameField,
            userEmailField,
            userPhoneField,
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Visibility(
              visible: state is UserProfileLoadingState,
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(10),
                minHeight: 6,
                color: context.theme.appColors.primary,
                backgroundColor: context.theme.appColors.surface,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: ProfileImageSection(profileImgUrl: userBloc.user.photoUrl),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextInputField(
              textEditingController: userNameField,
              height: 55,
              hint: "user name",
              enabled: true,
              bkColor: context.theme.appColors.surface,
              textColor: context.theme.appColors.onSurface,
              focusColor: context.theme.appColors.primary,
              prefix: const Icon(FontAwesomeIcons.userLarge),
              onChange: (value) => userBloc.user.name = value,
              onSubmitted: (value) {
                userBloc.add(UserProfileUpdateEvent());
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextInputField(
              textEditingController: userEmailField,
              height: 55,
              hint: "user email",
              enabled: true,
              textColor: context.theme.appColors.onSurface,
              bkColor: context.theme.appColors.surface,
              focusColor: context.theme.appColors.primary,
              prefix: const Icon(FontAwesomeIcons.solidEnvelope),
              onChange: (value) => userBloc.user.email = value,
              onSubmitted: (value) {
                userBloc.add(UserProfileUpdateEvent());
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextInputField(
              textEditingController: userPhoneField,
              height: 55,
              hint: "user phone",
              enabled: false,
              textColor: context.theme.appColors.onSurface,
              bkColor: context.theme.appColors.surface,
              focusColor: context.theme.appColors.primary,
              prefix: const Icon(FontAwesomeIcons.phone),
              onChange: (value) => userBloc.user.email = value,
              onSubmitted: (value) {
                userBloc.add(UserProfileUpdateEvent());
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }

  void updateProfileFields(
      UserProfileBloc userBloc,
      UserProfileStatus state,
      TextEditingController userNameField,
      TextEditingController userEmailField,
      TextEditingController userPhoneField) {
    userNameField.text = state.user?.name ?? userBloc.user.name ?? "";
    userEmailField.text = state.user?.email ?? userBloc.user.email ?? "";
    userPhoneField.text = state.user?.phone ?? userBloc.user.phone ?? "";
  }
}
