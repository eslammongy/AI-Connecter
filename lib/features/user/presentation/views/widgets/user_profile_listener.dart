import 'package:ai_connect/core/utils/dialog_manager.dart';
import 'package:ai_connect/core/utils/helper.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_events.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_bloc.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileListener extends StatelessWidget {
  const UserProfileListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserProfileBloc, UserProfileStatus>(
      listener: (context, state) {
        if (state is UserProfileLoadingState) {
          LoadingDialogManager.of(context).displayDialog();
        }
        // after creating user profile success we navigate to dashboard, and keep the use signed in
        if (state is UserProfileCreateState) {
          AuthBloc.get(context).add(AuthKeepUserSignedInEvent(
            token: state.user.token,
          ));
        }
        if (state is UserProfileFailureState) {
          LoadingDialogManager.closeDialog();
          displaySnackBar(context, state.errorMsg ?? "");
        }
      },
      child: child,
    );
  }
}
