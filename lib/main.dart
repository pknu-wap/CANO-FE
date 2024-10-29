import 'package:cano/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cano/desginsystem/colors.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var index = 0;

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

    return MaterialApp.router(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            surfaceTintColor: AppColors.primary,
          ),
          primaryColor: const Color(0xFF3E160C),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.primary,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
          ),
          tabBarTheme: const TabBarTheme(
            labelColor: Color(0xFF3E160C),
            unselectedLabelColor: Colors.grey,
            // indicator: BoxDecoration(
            //   color: Colors.white,
            // ),
          ),
          cardTheme: const CardTheme(
            color: Colors.white,
          )),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
