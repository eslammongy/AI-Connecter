import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/utils/app_routes.dart';
import 'package:ai_connect/core/utils/dialog_manager.dart';
import 'package:ai_connect/core/utils/helper.dart';
import 'package:ai_connect/core/widgets/custom_elevated_btn.dart';
import 'package:ai_connect/core/widgets/delete_component/clear_cache_btn.dart';
import 'package:ai_connect/core/widgets/delete_component/confirm_delete_action.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_events.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_status.dart';
import 'package:ai_connect/features/auth/presentation/widgets/profile_image_widget.dart';
import 'package:ai_connect/features/chatting/presentation/views/widgets/custom_text_input_filed.dart';
import 'package:ai_connect/features/settings/presentation/widgets/app_settings_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getAuthBloc,
      child: BlocConsumer<AuthBloc, AuthStatus>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
            LoadingDialogManager.of(context).displayDialog();
          }

          if (state is AuthSignOutState) {
            AuthBloc.get(context).add(AuthKeepUserSignedInEvent(token: null));
            GoRouter.of(context).pushReplacement(AppRoutes.auth);
          }
          if (state is AuthFailureState) {
            LoadingDialogManager.closeDialog();
            debugPrint("PhoneErrorMsg: ${state.message}");
            displaySnackBar(context, state.message ?? "");
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: kToolbarHeight,
                ),
                AppSettingsComponent(),
                const SizedBox(
                  height: kToolbarHeight,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ProfileImageSection(profileImgUrl: "profileImgUrl"),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextInputField(
                  textEditingController: TextEditingController(),
                  height: 55,
                  hint: "user name",
                  enabled: false,
                  bkColor: context.theme.appColors.surface,
                  focusColor: context.theme.appColors.primary,
                  prefix: const Icon(FontAwesomeIcons.userLarge),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextInputField(
                  textEditingController: TextEditingController(),
                  height: 55,
                  hint: "user name",
                  enabled: false,
                  bkColor: context.theme.appColors.surface,
                  focusColor: context.theme.appColors.primary,
                  prefix: const Icon(FontAwesomeIcons.solidEnvelope),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextInputField(
                  textEditingController: TextEditingController(),
                  height: 55,
                  hint: "user name",
                  enabled: false,
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
                        AuthBloc.get(context).add(AuthSignOutEvent());
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
