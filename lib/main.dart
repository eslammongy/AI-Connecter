import 'package:ai_connect/core/constant/app_strings.dart';
import 'package:ai_connect/core/constant/fake_json.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/utils/app_routes.dart';
import 'package:ai_connect/core/utils/service_locator.dart';
import 'package:ai_connect/features/settings/domain/usecases/change_chatting_font_uc.dart';
import 'package:ai_connect/features/settings/domain/usecases/keep_user_logged_uc.dart';
import 'package:ai_connect/features/settings/domain/usecases/reset_user_session_uc.dart';
import 'package:ai_connect/features/settings/domain/usecases/set_app_theme_uc.dart';
import 'package:ai_connect/features/settings/presentation/bloc/SettingsBloc.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_events.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  fillQuestionList();
  await initServiceLocator();
  runApp(
    const AIConnector(),
  );
}

class AIConnector extends StatelessWidget {
  const AIConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getSettingsBloc()
        ..add(SettingCheckIsUserSignedEvent())
        ..add(SettingGetAppThemeEvent()),
      child: BlocBuilder<SettingsBloc, SettingStatus>(
        builder: (context, state) {
          final appTheme = SettingsBloc.get(context).theme;
          final isUserSigned = SettingsBloc.get(context).isUserSigned;
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: appTheme,
            routerConfig: AppRoutes.initRoutes(
              isSignedIn: isUserSigned,
            ),
          );
        },
      ),
    );
  }

  SettingsBloc getSettingsBloc() {
    return SettingsBloc(
      keepUserLoggedUCase: getIt<KeepUserLoggedUCase>(),
      switchAppThemeUCase: getIt<SetAppThemeUCase>(),
      changeChattingFontUCase: getIt<ChangeChattingFontUCase>(),
      resetUserSessionUCase: getIt<ResetUserSessionUCase>(),
    );
  }
}
