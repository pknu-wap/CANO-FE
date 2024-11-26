import 'package:cano/desginsystem/colors.dart';
import 'package:cano/view/screen/auth/login_screen.dart';
import 'package:cano/view/screen/home/home_screen.dart';
import 'package:cano/view/screen/menu/menu_screen.dart';
import 'package:cano/view/screen/my_page/modify_user_profile_screen.dart';
import 'package:cano/view/screen/my_page/my_page_screen.dart';
import 'package:cano/view/screen/register_menu/register_menu_screen.dart';
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
        redirect: (context, state) async {
          final isLoggedIn = await CanoTokenManager().checkToken();
          return isLoggedIn ? '/home' : '/login';
        },
      ),
      GoRoute(
          path: '/login',
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
            return CoffeePreferenceScreen();
          }),
      GoRoute(
          path: '/modify_user_profile',
          builder: (context, state) {
            return const ModifyUserProfileScreen();
          }),
      GoRoute(
          path: '/modify_coffee_preference',
          builder: (context, state) {
            return CoffeePreferenceScreen();
          }),
      GoRoute(
          path: '/register_menu',
          builder: (context, state) {
            return RegisterMenuScreen();
          }),
      GoRoute(
          path: '/menu',
          builder: (context, state) {
            return MenuScreen();
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
                builder: (context, state) => HomeScreen(),
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
