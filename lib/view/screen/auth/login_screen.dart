import 'package:cano/desginsystem/colors.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:cano/view/widget/auth/auth_input_field.dart';
import 'package:cano/view/widget/custom_button.dart';
import 'package:cano/view/widget/custom_icon_button.dart';
import 'package:cano/viewmodel/auth/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(AppStrings.login,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Text("이메일", style: TextStyle(fontSize: 18)),
            ),
          ),
          const SizedBox(height: 15),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: AuthInputField(
                lableText: "이메일을 입력해주세요.",
                keyboardType: TextInputType.emailAddress,
              )),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Text("비밀번호", style: TextStyle(fontSize: 18)),
            ),
          ),
          const SizedBox(height: 15),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: AuthInputField(
                lableText: "비밀번호를 입력해주세요.",
                keyboardType: TextInputType.visiblePassword,
              )),
          const SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomButton(
              text: AppStrings.login,
              buttonColor: AppColors.primary,
              height: 40,
              onPressed: () {
                context.push('/user_profile');
              },
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: CustomButton(
              text: "회원가입",
              buttonColor: AppColors.primary,
              height: 40,
            ),
          ),
          const SizedBox(height: 20),
          const Text("또는",
              style: TextStyle(color: Colors.black26, fontSize: 15)),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconPngButton(
                  size: 55,
                  imagePath: "assets/images/kakao_login_icon.png",
                  onPressed: () {
                    ref
                        .watch(authProvider.notifier)
                        .kakaoLogin(() => context.go('/user_profile'));
                  }),
              SizedBox(width: 20),
              CustomIconSvgButton(
                size: 55,
                imagePath: "assets/images/android_light_rd_na.svg",
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
