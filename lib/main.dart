import 'package:ai_connect/core/constant/app_strings.dart';
import 'package:ai_connect/core/constant/fake_json.dart';
import 'package:ai_connect/core/routes/app_routes.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_events.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_status.dart';
import 'package:ai_connect/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/utils/helper.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: ".env");
  fillQuestionList();
  await initAppDependencies();
  await runAiConnectorApp();
}

Future<void> runAiConnectorApp() async {
  return await Future.delayed(const Duration(milliseconds: 400), () {
    FlutterNativeSplash.remove();
    runApp(
      const AIConnector(),
    );
  });
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
