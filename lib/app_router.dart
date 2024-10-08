import 'package:cano/view/screen/auth/login_screen.dart';
import 'package:cano/view/screen/user_info/coffee_preference_screen.dart';
import 'package:cano/view/screen/user_info/user_profile_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) {
            return LoginScreen();
          }),
      GoRoute(
          path: '/user_profile',
          builder: (context, state) {
            return UserProfileScreen();
          }),
      GoRoute(
          path: '/coffee_preference',
          builder: (context, state) {
            return CoffeePreferenceScreen();
          }),
    ],
  );
}
