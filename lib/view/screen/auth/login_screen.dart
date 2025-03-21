import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../desginsystem/colors.dart';
import '../../../desginsystem/strings.dart';
import '../../../viewmodel/auth/auth_viewmodel.dart';
import '../../widget/custom_icon_button.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/cano_icon.svg"),
            const SizedBox(
              height: 30,
            ),
            const Text(AppStrings.appName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: AppColors.primary)),
            const SizedBox(height: 30),
            CustomIconSvgButton(
                imagePath: "assets/images/kakao_login.svg",
                onPressed: () {
                  ref.read(authProvider.notifier).loginWithKakao(() {
                    context.go('/home');
                  }, () {
                    context.go('/user_profile');
                  });
                }),
            const SizedBox(
              height: 15,
            ),
            CustomIconSvgButton(
              imagePath: "assets/images/google_login.svg",
              onPressed: () {
                // ref
                //     .read(authProvider.notifier)
                //     .loginWithGoogle(() => context.go('/user_profile'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
