import 'package:ai_connect/core/widgets/adaptive_home/adaptive_home_layout.dart';
import 'package:ai_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_connect/features/auth/presentation/screen/auth_screen.dart';
import 'package:ai_connect/features/auth/presentation/screen/otp_verification_screen.dart';
import 'package:ai_connect/features/auth/presentation/screen/phone_auth_screen.dart';
import 'package:ai_connect/features/chatting/domain/entities/chat_entity.dart';
import 'package:ai_connect/features/chatting/presentation/views/screen/chat_history_screen.dart';
import 'package:ai_connect/features/chatting/presentation/views/screen/chatting_screen.dart';
import 'package:ai_connect/features/chatting/presentation/views/screen/home_screen.dart';
import 'package:ai_connect/features/dashboard/dashboard_screen.dart';
import 'package:ai_connect/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_bloc.dart';
import 'package:ai_connect/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String dashboard = '/dashboard';
  static const String home = '/home';
  static const String chattingScreen = '/chattingScreen';
  static const String chatHistoryScreen = '/chatHistoryScreen';
  static const String auth = '/auth';
  static const String phoneAuthScreen = '/phoneAuthScreen';
  static const String otpVerificationScreen = '/otpVerificationScreen';
  static const String search = '/search';

  static GoRouter initRoutes({required bool isSignedIn}) {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return AdaptiveHomeLayout(isSignedIn: isSignedIn);
          },
        ),
        GoRoute(
          path: onboarding,
          builder: (context, state) {
            return const OnboardingScreen();
          },
        ),
        GoRoute(
          path: dashboard,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => profileBlocProviderBuilder(),
              child: DashboardScreen(),
            );
          },
        ),
        GoRoute(
          path: home,
          builder: (context, state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: auth,
          builder: (context, state) {
            return authMultiBlocProviderWrapper(child: const AuthScreen());
          },
        ),
        GoRoute(
          path: phoneAuthScreen,
          builder: (context, state) {
            return authMultiBlocProviderWrapper(
              child: const PhoneAuthScreen(),
            );
          },
        ),
        GoRoute(
          path: otpVerificationScreen,
          builder: (context, state) {
            final phone = state.extra as String;
            return authMultiBlocProviderWrapper(
              child: OtpVerificationScreen(
                phoneNum: phone,
              ),
            );
          },
        ),
        GoRoute(
          path: chattingScreen,
          builder: (context, state) {
            final chat = state.extra as ChatEntity?;
            return ChattingScreen(chatEntity: chat);
          },
        ),
        GoRoute(
          path: chatHistoryScreen,
          builder: (context, state) {
            return const ChatHistoryScreen();
          },
        ),
      ],
    );
  }

  static MultiBlocProvider authMultiBlocProviderWrapper(
      {required Widget child}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => profileBlocProviderBuilder(),
        ),
      ],
      child: child,
    );
  }
}

UserProfileBloc profileBlocProviderBuilder() {
  return UserProfileBloc(
    createUserProfileUCase: getIt(),
    fetchUserProfileUcase: getIt(),
    setUserProfileImgUcase: getIt(),
    updateUserProfileUcase: getIt(),
  );
}
