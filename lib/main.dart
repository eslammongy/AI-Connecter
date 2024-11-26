import 'package:ai_connect/core/constant/app_strings.dart';
import 'package:ai_connect/core/constant/fake_json.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/utils/app_routes.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_events.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_status.dart';
import 'package:ai_connect/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/helper.dart';

late final bool isUserSigned;

Future<void> main() async {
  fillQuestionList();
  await initAppDependencies();
  isUserSigned = await checkIsUserSigned();
  runApp(
    const AIConnector(),
  );
}

class AIConnector extends StatelessWidget {
  const AIConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getSettingsBloc
        ..add(SettingGetAppThemeEvent())
        ..add(SettingGetChattingFontEvent()),
      child: BlocBuilder<SettingsBloc, SettingStatus>(
        builder: (context, state) {
          final appTheme = SettingsBloc.get(context).theme;

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
}
