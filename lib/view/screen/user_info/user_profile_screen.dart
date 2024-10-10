import 'package:cano/desginsystem/colors.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:cano/view/widget/custom_button.dart';
import 'package:cano/view/widget/custom_icon_button.dart';
import 'package:cano/view/widget/outlined_text_field.dart';
import 'package:cano/view/widget/profile_image.dart';
import 'package:cano/view/widget/progress_bar.dart';
import 'package:cano/view/widget/user_info/square_button.dart';
import 'package:cano/viewmodel/user_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoProvider);

    ref.listen(userInfoProvider, (prev, next) {
      print("현재 상태: $next");
    });

    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 65),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: ProgressBar(percent: 0.25)),
              const SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    AppStrings.profileText,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(AppStrings.profileInfoText,
                      style: TextStyle(color: Colors.black26, fontSize: 12)),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 30),
                  const ProfileImage(),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(AppStrings.nickname,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        OutlinedTextField(
                            onChanged: (text) {
                              ref
                                  .watch(userInfoProvider.notifier)
                                  .setName(text);
                            },
                            hintText: AppStrings.nickname,
                            borderRadius: 50,
                            width: 200,
                            height: 45),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomIconSvgButton(
                        size: 60,
                        onPressed: () => ref
                            .watch(userInfoProvider.notifier)
                            .setGender(false),
                        idx: false,
                      ),
                      Text(
                        AppStrings.man,
                        style: TextStyle(
                            color: userInfo.gender == false
                                ? AppColors.primary
                                : Colors.black26),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomIconSvgButton(
                        onPressed: () {
                          ref.watch(userInfoProvider.notifier).setGender(true);
                        },
                        idx: true,
                        size: 60,
                      ),
                      Text(
                        AppStrings.woman,
                        style: TextStyle(
                            color: userInfo.gender == true
                                ? AppColors.primary
                                : Colors.black26),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  const SizedBox(
                    width: 70,
                  ),
                  SquareButton(
                    onTap: () =>
                        ref.watch(userInfoProvider.notifier).setAge(10),
                    onClear: () =>
                        ref.watch(userInfoProvider.notifier).setAge(0),
                    text: "10대",
                    size: 85,
                    age: 10,
                    selectedAge: userInfo.age,
                  ),
                  const SizedBox(width: 10),
                  SquareButton(
                      onTap: () =>
                          ref.watch(userInfoProvider.notifier).setAge(20),
                      onClear: () =>
                          ref.watch(userInfoProvider.notifier).setAge(0),
                      text: "20대",
                      size: 85,
                      age: 20,
                      selectedAge: userInfo.age),
                  const SizedBox(width: 10),
                  SquareButton(
                      onTap: () =>
                          ref.watch(userInfoProvider.notifier).setAge(30),
                      onClear: () =>
                          ref.watch(userInfoProvider.notifier).setAge(0),
                      text: "30대",
                      size: 85,
                      age: 30,
                      selectedAge: userInfo.age)
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const SizedBox(
                    width: 70,
                  ),
                  SquareButton(
                      onTap: () =>
                          ref.watch(userInfoProvider.notifier).setAge(40),
                      onClear: () =>
                          ref.watch(userInfoProvider.notifier).setAge(0),
                      text: "40대",
                      size: 85,
                      age: 40,
                      selectedAge: userInfo.age),
                  const SizedBox(width: 10),
                  SquareButton(
                      onTap: () =>
                          ref.watch(userInfoProvider.notifier).setAge(50),
                      onClear: () =>
                          ref.watch(userInfoProvider.notifier).setAge(0),
                      text: "50대",
                      size: 85,
                      age: 50,
                      selectedAge: userInfo.age),
                  const SizedBox(width: 10),
                  SquareButton(
                      onTap: () =>
                          ref.watch(userInfoProvider.notifier).setAge(60),
                      onClear: () =>
                          ref.watch(userInfoProvider.notifier).setAge(0),
                      text: "60대\n이상",
                      size: 85,
                      age: 60,
                      selectedAge: userInfo.age)
                ],
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: CustomButton(
                  text: AppStrings.next,
                  height: 55,
                  onPressed: () {
                    if (userInfo.name != "" &&
                        userInfo.age != 0 &&
                        userInfo.gender != null)
                      context.push('/coffee_preference');
                  },
                ),
              )
            ],
          ),
        ));
  }
}
