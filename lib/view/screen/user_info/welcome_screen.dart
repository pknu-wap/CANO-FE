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
      body: Column(
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
          // 화살표 버튼
          const SizedBox(
            height: 200,
          ),
          GestureDetector(
            onTap: () {
              context.push('/nextScreen');
            },
            child: const Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Icon(
                Icons.keyboard_double_arrow_right_outlined,
                size: 120,
                color: Colors.white38,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
