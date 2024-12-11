import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/utils/helper.dart';
import 'package:ai_connect/core/widgets/custom_elevated_btn.dart';
import 'package:ai_connect/core/widgets/delete_component/clear_cache_btn.dart';
import 'package:ai_connect/core/widgets/delete_component/confirm_delete_action.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_events.dart';
import 'package:ai_connect/features/auth/presentation/widgets/profile_image_widget.dart';
import 'package:ai_connect/features/chatting/presentation/views/widgets/custom_text_input_filed.dart';
import 'package:ai_connect/features/user/domain/entities/user_entity.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_bloc.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_events.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({
    super.key,
    required this.userNameField,
    required this.userEmailField,
    required this.userPhoneField,
  });

  final TextEditingController userNameField;
  final TextEditingController userEmailField;
  final TextEditingController userPhoneField;

  @override
  Widget build(BuildContext context) {
    final userBloc = UserProfileBloc.get(context);
    return BlocConsumer<UserProfileBloc, UserProfileStatus>(
      bloc: UserProfileBloc.get(context)..add(UserProfileFetchEvent()),
      listener: (context, state) {
        if (state is UserProfileFailureState) {
          debugPrint("UserProfileFailureState: ${state.errorMsg}");
          displaySnackBar(context, state.errorMsg ?? "");
        }
        if (state is UserProfileFetchState) {
          _updateUserData(state.user);
        }
        if (state is UserProfileUpdateState) {
          _updateUserData(state.user);
        }
        if (state is UserProfileSetImgState) {
          userBloc.user =
              userBloc.user.toModel.copyWith(photoUrl: state.imgUrl);
          userBloc.add(UserProfileUpdateEvent(user: userBloc.user));
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
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
                  child: ProfileImageSection(
                      profileImgUrl: userBloc.user.photoUrl),
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
                  onSubmitted: (value) {
                    userBloc.add(UserProfileUpdateEvent(
                        user: userBloc.user.toModel.copyWith(name: value)));
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
                  onSubmitted: (value) {
                    userBloc.add(UserProfileUpdateEvent(
                        user: userBloc.user.toModel.copyWith(email: value)));
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
                ),
                const SizedBox(
                  height: 20,
                ),
                DeleteComponent(),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomElevatedBtn(
                  text: "Sign out",
                  bkColor: context.theme.appColors.error,
                  icon: null,
                  onPressed: () {
                    displayConfirmationActionDialog(
                      context,
                      title: "Sign out",
                      description: "Are you sure you want to sign out",
                      onConfirm: () {
                        userBloc.shouldFetch = false;
                        AuthBloc.get(context).add(AuthSignOutEvent());
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _updateUserData(UserEntity user) {
    userNameField.text = user.name ?? "";
    userEmailField.text = user.email ?? "";
    userPhoneField.text = user.phone ?? "";
  }
}
