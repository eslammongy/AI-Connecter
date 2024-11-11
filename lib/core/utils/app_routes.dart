import 'package:ai_connect/features/auth/presentation/auth_screen.dart';
import 'package:ai_connect/features/home/presentation/home_screen.dart';
import 'package:ai_connect/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String home = '/home';
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
