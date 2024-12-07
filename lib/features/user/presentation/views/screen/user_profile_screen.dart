import 'package:ai_connect/core/routes/app_routes.dart';
import 'package:ai_connect/core/utils/dialog_manager.dart';
import 'package:ai_connect/core/utils/helper.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_events.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_status.dart';
import 'package:ai_connect/features/user/presentation/views/widgets/profile_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userNameField = TextEditingController();
    final userPhoneField = TextEditingController();
    final userEmailField = TextEditingController();
    return BlocConsumer<AuthBloc, AuthStatus>(
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
        return ProfileScreenBody(
            userNameField: userNameField,
            userEmailField: userEmailField,
            userPhoneField: userPhoneField);
      },
    );
  }
}
