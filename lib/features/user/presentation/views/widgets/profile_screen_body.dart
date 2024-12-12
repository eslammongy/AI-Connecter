import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/utils/helper.dart';
import 'package:ai_connect/core/widgets/custom_elevated_btn.dart';
import 'package:ai_connect/core/widgets/delete_component/clear_cache_btn.dart';
import 'package:ai_connect/core/widgets/delete_component/confirm_delete_action.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_events.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_bloc.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_events.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_status.dart';
import 'package:ai_connect/features/user/presentation/views/widgets/profile_screen_fileds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userBloc = UserProfileBloc.get(context);
    return BlocListener<UserProfileBloc, UserProfileStatus>(
      bloc: UserProfileBloc.get(context)..add(UserProfileFetchEvent()),
      listener: (context, state) {
        if (state is UserProfileFailureState) {
          displaySnackBar(context, state.errorMsg ?? "");
        }
        if (state is UserProfileSetImgState) {
          userBloc.user.photoUrl = state.imgUrl;
          userBloc.add(UserProfileUpdateEvent(user: userBloc.user));
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              ProfileScreenChangeableComponent(),
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
      ),
    );
  }
}
