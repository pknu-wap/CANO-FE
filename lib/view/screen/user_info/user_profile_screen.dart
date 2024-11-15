import 'package:cano/desginsystem/colors.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:cano/utils/mediaquery.dart';
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
    final Map<int, String> ageLabels = {
      10: "10대",
      20: "20대",
      30: "30대",
      40: "40대",
      50: "50대",
      60: "60대\n이상"
    };

    ref.listen(userInfoProvider, (prev, next) {
      print("현재 상태: $next");
    });

    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 65),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: ProgressBar(percent: 0.25)),
            const SizedBox(height: 30),
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
            const SizedBox(height: 5),
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
                Stack(
                  children: [
                    ProfileImage(
                      imagePath: userInfo.profileImageUrl,
                    ), // 기본 아이콘
                    Positioned(
                      right: 3,
                      bottom: 3,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.primary, width: 1.0)),
                        child: IconButton(
                          padding: EdgeInsets.all(2), // 아이콘 간격 없애기
                          icon: Icon(Icons.add,
                              size: 15, color: AppColors.primary),
                          onPressed: () {
                            ref
                                .watch(userInfoProvider.notifier)
                                .pickImageFromGallery(
                                    context,
                                    (imagePath) => ref
                                        .watch(userInfoProvider.notifier)
                                        .setProfileImageUrl(imagePath));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
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
                            ref.watch(userInfoProvider.notifier).setName(text);
                          },
                          hintText: AppStrings.nickname,
                          borderRadius: 50,
                          height: 45),
                    ],
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomIconPngButton(
                      size: 60,
                      imagePath: "assets/images/man.png",
                      onPressed: () =>
                          ref.watch(userInfoProvider.notifier).setGender(false),
                      idx: false,
                      selectedIdx: userInfo.gender,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      AppStrings.man,
                      style: TextStyle(
                          color: userInfo.gender == false
                              ? AppColors.primary
                              : Colors.black26,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomIconPngButton(
                      onPressed: () {
                        ref.watch(userInfoProvider.notifier).setGender(true);
                      },
                      imagePath: "assets/images/woman.png",
                      idx: true,
                      selectedIdx: userInfo.gender,
                      size: 60,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      AppStrings.woman,
                      style: TextStyle(
                          color: userInfo.gender == true
                              ? AppColors.primary
                              : Colors.black26,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Wrap(
                  runSpacing: 15,
                  spacing: 15,
                  children: ageLabels.entries.map((entry) {
                    return SquareButton(
                        age: entry.key,
                        text: entry.value,
                        size: mediaWidth(context, 0.22),
                        onTap: () => ref
                            .watch(userInfoProvider.notifier)
                            .setAge(entry.key),
                        onClear: () =>
                            ref.watch(userInfoProvider.notifier).setAge(0),
                        selectedAge: userInfo.age);
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: CustomButton(
                text: AppStrings.next,
                height: 55,
                buttonColor: userInfo.name != "" &&
                        userInfo.age != 0 &&
                        userInfo.gender != null
                    ? AppColors.primary
                    : Colors.black26,
                onPressed: () {
                  if (userInfo.name != "" &&
                      userInfo.age != 0 &&
                      userInfo.gender != null)
                    context.push('/coffee_preference');
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ));
  }
}
