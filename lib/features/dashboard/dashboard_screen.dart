import 'package:ai_connect/core/widgets/bottom_nav_bar.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_connect/features/chatting/presentation/views/screen/archived_questions_screen.dart';
import 'package:ai_connect/features/chatting/presentation/views/screen/home_screen.dart';
import 'package:ai_connect/features/chatting/presentation/views/widgets/custom_appbar.dart';
import 'package:ai_connect/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_bloc.dart';
import 'package:ai_connect/features/user/presentation/views/screen/user_profile_screen.dart';
import 'package:ai_connect/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<UserProfileBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppbar(
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
      ),
    );
  }
}
