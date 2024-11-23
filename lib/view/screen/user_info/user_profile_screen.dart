import 'package:cano/desginsystem/colors.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:cano/view/widget/custom_button.dart';
import 'package:cano/view/widget/outlined_text_field.dart';
import 'package:cano/view/widget/profile_image.dart';
import 'package:cano/viewmodel/user_info/user_info_viewmodel.dart';
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 65),
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
                child: const Text(AppStrings.interestRecommendationText,
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
                          padding: EdgeInsets.all(2),
                          icon: Icon(Icons.add,
                              size: 15, color: AppColors.primary),
                          onPressed: () {
                            ref
                                .read(userInfoProvider.notifier)
                                .pickImageFromGallery(
                                    context,
                                    (imagePath) => ref
                                        .watch(userInfoProvider.notifier)
                                        .setProfileImageUrl(imagePath));
                          },
                        ),
                      ),
                    ),
                    if (userInfo.profileImageUrl != null)
                      Positioned(
                        right: 0,
                        top: 3,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColors.primary, width: 1.0)),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(
                              "X",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                            onPressed: () {
                              ref
                                  .read(userInfoProvider.notifier)
                                  .setProfileImageUrl(null);
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
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: CustomButton(
                text: AppStrings.next,
                height: 55,
                buttonColor:
                    userInfo.name != "" ? AppColors.primary : Colors.black26,
                onPressed: () {
                  context.push('/coffee_preference');
                },
              ),
            ),
            const SizedBox(height: 50),
          ],
        ));
  }
}
