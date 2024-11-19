import 'package:ai_connect/features/chatting/presentation/views/screen/chat_history_screen.dart';
import 'package:ai_connect/features/chatting/presentation/views/screen/chatting_screen.dart';
import 'package:ai_connect/features/chatting/presentation/views/screen/home_screen.dart';
import 'package:ai_connect/features/dashboard/dashboard_screen.dart';
import 'package:ai_connect/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:ai_connect/features/user/presentation/screen/auth_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String dashboard = '/dashboard';
  static const String home = '/home';
  static const String chattingScreen = '/chattingScreen';
  static const String chatHistoryScreen = '/chatHistoryScreen';
  static const String auth = '/auth';
  static const String search = '/search';

  static GoRouter initRoutes() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return const OnboardingScreen();
          },
        ),
        GoRoute(
          path: dashboard,
          builder: (context, state) {
            return const DashboardScreen();
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
            return const AuthScreen();
          },
        ),
        GoRoute(
          path: chattingScreen,
          builder: (context, state) {
            return const ChattingScreen();
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
}
