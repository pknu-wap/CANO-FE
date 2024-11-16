import 'package:cano/desginsystem/colors.dart';
import 'package:cano/view/screen/auth/login_screen.dart';
import 'package:cano/view/screen/cafe_info/cafe_info_screen.dart';
import 'package:cano/view/screen/home/home_screen.dart';
import 'package:cano/view/screen/my_page/my_page_screen.dart';
import 'package:cano/view/screen/search/search_screen.dart';
import 'package:cano/view/screen/user_info/coffee_preference_screen.dart';
import 'package:cano/view/screen/user_info/user_profile_screen.dart';
import 'package:cano/viewmodel/auth/cano_token_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) {
            return FutureBuilder<bool>(
                future: CanoTokenManager().checkToken(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data == true)
                    return HomeScreen();
                  else
                    return LoginScreen();
                });
          }),
      GoRoute(
          path: '/user_profile',
          builder: (context, state) {
            return const UserProfileScreen();
          }),
      GoRoute(
          path: '/coffee_preference',
          builder: (context, state) {
            return CoffeePreferenceScreen();
          }),
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
      )
    ],
  );
}
