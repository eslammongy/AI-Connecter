import 'package:ai_connect/core/widgets/bottom_nav_bar.dart';
import 'package:ai_connect/features/auth/presentation/screen/user_profile_screen.dart';
import 'package:ai_connect/features/chatting/presentation/views/screen/archived_questions_screen.dart';
import 'package:ai_connect/features/chatting/presentation/views/screen/home_screen.dart';
import 'package:ai_connect/features/chatting/presentation/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  final listOfScreens = [
    HomeScreen(),
    ArchivedQuestionsScreen(),
    UserProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentIndex == 2
          ? null
          : CustomAppbar(
              index: currentIndex,
            ),
      extendBody: true,
      body: listOfScreens[currentIndex],
      bottomNavigationBar: FloatingBottomNavBar(
        currentIndex: currentIndex,
        getCurrentIndex: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
