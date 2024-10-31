import 'package:cano/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cano/desginsystem/colors.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';

void main() async {
  await dotenv.load(fileName: 'assets/config/.env');

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();

  String? kakaoNativeAppKey = dotenv.env['KAKAO_NATIVE_APP_KEY'];
  KakaoSdk.init(
    nativeAppKey: kakaoNativeAppKey,
  );

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
