import 'package:cano/view/screen/auth/login_screen.dart';
import 'package:cano/view/screen/user_info/coffee_preference_screen.dart';
import 'package:cano/view/screen/user_info/keyword_preference_screen.dart';
import 'package:cano/view/screen/user_info/location_preference_screen.dart';
import 'package:cano/view/screen/user_info/user_profile_screen.dart';
import 'package:cano/view/screen/user_info/welcome_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) {
            return const LoginScreen();
          }),
      GoRoute(
          path: '/user_profile',
          builder: (context, state) {
            return const UserProfileScreen();
          }),
      GoRoute(
          path: '/coffee_preference',
          builder: (context, state) {
            return const CoffeePreferenceScreen();
          }),
      GoRoute(
          path: '/keyword_preference',
          builder: (context, state) {
            return const KeywordPreferenceScreen();
          }),
      GoRoute(
          path: '/location_preference',
          builder: (context, state) {
            return const LocationPreferenceScreen();
          }),
      GoRoute(
        path: '/welcome',
        builder: (context, state) {
          return WelcomeScreen();
        },
      )
    ],
  );
}
