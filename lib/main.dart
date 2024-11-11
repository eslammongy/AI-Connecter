import 'package:ai_connect/core/constant/app_strings.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AIConnector());
}

class AIConnector extends StatelessWidget {
  const AIConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
        routerConfig: AppRoutes.initRoutes(),
    );
  }
}
