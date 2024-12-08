import 'package:ai_connect/features/dashboard/dashboard_screen.dart';
import 'package:ai_connect/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_bloc.dart';
import 'package:ai_connect/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'adaptive_layout.dart';
import 'desktop_home_screen.dart';
import 'tablet_home_screen.dart';

class AdaptiveHomeLayout extends StatelessWidget {
  const AdaptiveHomeLayout({super.key, required this.isSignedIn});
  final bool isSignedIn;

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (context) =>
          isSignedIn ? DashboardScreen() : OnboardingScreen(),
      tabletLayout: (context) => const TabletHomeScreen(),
      desktopLayout: (context) => const DesktopHomeScreen(),
    );
  }

  Widget profileBlocProviderWrapper(Widget child) {
    return BlocProvider<UserProfileBloc>(
      create: (context) => UserProfileBloc(
        createUserProfileUCase: getIt(),
        fetchUserProfileUcase: getIt(),
        setUserProfileImgUcase: getIt(),
        updateUserProfileUcase: getIt(),
      ),
      child: child,
    );
  }
}
