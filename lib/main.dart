import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: <RouteBase>[],
  );

  @override
  Widget build(BuildContext context) {
    var _index = 0;

    // List _pages = [
    //   HomeScreen(),
    //   SearchScreen(),
    //   MyPageScreen(),
    // ];

    return MaterialApp.router(
      routerConfig: _router,
    );

    //   home: Scaffold(
    //     bottomNavigationBar: BottomNavigationBar(
    //       items: [
    //         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
    //         BottomNavigationBarItem(
    //             icon: Icon(Icons.account_circle_rounded), label: 'mypage'),
    //         BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'menu'),
    //       ],
    //     ),
    //   ),
    // );
  }
}
