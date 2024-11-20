import 'package:cano'
    '/app_router.dart';
import 'package:cano/utils/key_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cano/desginsystem/colors.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  await dotenv.load(fileName: 'assets/config/.env');

  // iOS에 환경변수 전달
  const platform = MethodChannel("com.example.cano/secure_keys");
  platform.invokeMethod('setEnv', {
    "KAKAO_NATIVE_APP_KEY": dotenv.env['KAKAO_NATIVE_APP_KEY'],
  });

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  String? kakaoNativeAppKey = await KeyManager().getKakaoNativeAppKey();

  KakaoSdk.init(
    nativeAppKey: kakaoNativeAppKey,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.cano,
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
