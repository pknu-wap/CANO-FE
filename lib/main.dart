import 'package:cano/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var _index = 0;

    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    FlutterNativeSplash.remove();
    // List _pages = [
    //   HomeScreen(),
    //   SearchScreen(),
    //   MyPageScreen(),
    // ];

    //     home: Scaffold(
    //       bottomNavigationBar: BottomNavigationBar(
    //         items: [
    //           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
    //           BottomNavigationBarItem(
    //               icon: Icon(Icons.account_circle_rounded), label: 'mypage'),
    //           BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'menu'),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    //   return MaterialApp.router(
    //     routerConfig: _router );

    return MaterialApp.router(
        debugShowCheckedModeBanner: false, routerConfig: AppRouter.router);
  }
}
