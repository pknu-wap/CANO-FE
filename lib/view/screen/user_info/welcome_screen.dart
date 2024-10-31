import 'package:cano/viewmodel/user_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cano/desginsystem/colors.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoProvider);
    final userName = userInfo.name;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! < -50) {
            // 왼쪽으로 스와이프할 때 다음 화면으로 이동
            context.push('/nextScreen');
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 100),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                '환영합니다. $userName님,\n오늘의 CANO를 시작해보세요!',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 200),

            // 화 아이콘
            const Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Icon(
                Icons.keyboard_double_arrow_left_outlined,
                size: 120,
                color: Colors.white38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
