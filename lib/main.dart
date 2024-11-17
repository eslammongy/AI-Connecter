import 'package:ai_connect/core/constant/app_strings.dart';
import 'package:ai_connect/core/constant/fake_json.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/utils/app_routes.dart';
import 'package:ai_connect/core/utils/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/utils/theme_notifier.dart';

void main() {
  fillQuestionList();
  AppStorage.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: const AIConnector(),
    ),
  );
}

class AIConnector extends StatelessWidget {
  const AIConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (
      context,
      themeNotifier,
      child,
    ) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeNotifier.themeMode,
        routerConfig: AppRoutes.initRoutes(),
      );
    });
  }
}
