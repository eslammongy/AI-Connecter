import 'package:ai_connect/features/auth/presentation/screen/auth_screen.dart';
import 'package:ai_connect/features/chatting/presentation/views/screen/home_screen.dart';
import 'package:ai_connect/features/dashboard/dashboard_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String dashboard = '/dashboard';
  static const String home = '/home';
  static const String auth = '/auth';
  static const String search = '/search';

  static GoRouter initRoutes() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
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
      ],
    );
  }
}
