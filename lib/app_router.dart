import 'package:cano/desginsystem/colors.dart';
import 'package:cano/view/screen/auth/login_screen.dart';
import 'package:cano/view/screen/cafe_info/cafe_info_screen.dart';
import 'package:cano/view/screen/my_page/my_page_screen.dart';
import 'package:cano/view/screen/search/search_screen.dart';
import 'package:cano/view/screen/user_info/coffee_preference_screen.dart';
import 'package:cano/view/screen/user_info/keyword_preference_screen.dart';
import 'package:cano/view/screen/user_info/location_preference_screen.dart';
import 'package:cano/view/screen/user_info/user_profile_screen.dart';
import 'package:cano/view/screen/user_info/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
        path: '/cafe_info',
        builder: (context, state) {
          return const CafeInfoScreen();
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
    ),
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/search",
              builder: (context, state) => SearchScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/home",
              builder: (context, state) => CafeInfoScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/my_page",
              builder: (context, state) => MyPageScreen(),
            ),
          ],
        ),
      ],
      builder: (BuildContext context, GoRouterState state,
              StatefulNavigationShell navigationShell) =>
          Scaffold(
        body: navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                label: "조회"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: "홈"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                label: "마이페이지"),
          ],
          currentIndex: navigationShell.currentIndex,
          onTap: (int index) => navigationShell.goBranch(index),
          backgroundColor: AppColors.primary,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
        ),
      ),
    ),
  ]);
}
