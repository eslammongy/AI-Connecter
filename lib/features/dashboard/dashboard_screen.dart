import 'package:ai_connect/core/widgets/bottom_nav_bar.dart';
import 'package:ai_connect/features/auth/presentation/screen/user_profile_screen.dart';
import 'package:ai_connect/features/chatting/presentation/views/screen/archived_questions_screen.dart';
import 'package:ai_connect/features/chatting/presentation/views/screen/home_screen.dart';
import 'package:ai_connect/features/chatting/presentation/views/widgets/custom_appbar.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final listOfScreens = [
    HomeScreen(),
    ArchivedQuestionsScreen(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final settingsBloc = SettingsBloc.get(context);
    return Scaffold(
      appBar: settingsBloc.indexOfCurrScreen == 2
          ? null
          : CustomAppbar(
              index: settingsBloc.indexOfCurrScreen,
            ),
      extendBody: true,
      body: listOfScreens[settingsBloc.indexOfCurrScreen],
      bottomNavigationBar: FloatingBottomNavBar(
        currentIndex: settingsBloc.indexOfCurrScreen,
        getCurrentIndex: (int index) {
          setState(() {
            settingsBloc.indexOfCurrScreen = index;
          });
        },
      ),
    );
  }
}
