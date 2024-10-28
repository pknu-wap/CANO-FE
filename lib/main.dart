import 'package:cano'
    '/app_router.dart';
import 'package:cano/utils/key_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();

  String? kakaoNativeAppKey = KeyManager().getKakaoNativeAppKey().toString();
  KakaoSdk.init(
    nativeAppKey: kakaoNativeAppKey,
  );

  print(KakaoSdk.origin);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var index = 0;

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
        debugShowCheckedModeBanner: false, routerConfig: AppRouter.router);
  }
}
