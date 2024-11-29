import 'package:cano/desginsystem/colors.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:cano/permission/permission.dart';
import 'package:cano/view/widget/custom_button.dart';
import 'package:cano/view/widget/outlined_text_field.dart';
import 'package:cano/view/widget/profile_image.dart';
import 'package:cano/viewmodel/my_page/my_page_viewmodel.dart';
import 'package:cano/viewmodel/user_info/user_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../data/model/user_info/user_info.dart';

class ModifyUserProfileScreen extends ConsumerStatefulWidget {
  const ModifyUserProfileScreen({super.key});

  @override
  _ModifyUserProfileScreenState createState() =>
      _ModifyUserProfileScreenState();
}

class _ModifyUserProfileScreenState
    extends ConsumerState<ModifyUserProfileScreen> {
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    final userResponse = ref.watch(myPageProvider);
    await ref.read(userInfoProvider.notifier).setUserInfo(UserInfo(
        name: userResponse.name!,
        acidity:
            Intensitylevel.fromValue(intensityEngToKo(userResponse.acidity)),
        body: Intensitylevel.fromValue(intensityEngToKo(userResponse.body)),
        bitterness:
            Intensitylevel.fromValue(intensityEngToKo(userResponse.bitterness)),
        sweetness:
            Intensitylevel.fromValue(intensityEngToKo(userResponse.sweetness)),
        aroma: [],
        profileImageUrl: userResponse.profileImageUrl));
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = ref.watch(userInfoProvider);

    ref.listen(myPageProvider, (prev, next) {
      print("현재 상태: $next");
    });

    ref.listen(userInfoProvider, (prev, next) {
      print("현재 상태: $next");
    });

    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10),
              child: IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(Icons.arrow_back_ios)),
            ),
            SizedBox(height: 35),
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
                          onPressed: () async {
                            await getGalleryPermissionStatus()
                                ? ref
                                    .read(userInfoProvider.notifier)
                                    .pickProfileImage(
                                      context,
                                    )
                                : requestGalleryPermission();
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
                          initialText: userInfo.name,
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
                  if (userInfo.name.trim().isNotEmpty)
                    context.push('/modify_coffee_preference');
                },
              ),
            ),
            const SizedBox(height: 50),
          ],
        ));
  }
}

String intensityEngToKo(String? IntensityEng) {
  switch (IntensityEng) {
    case AppStrings.VERY_HIGH:
      return AppStrings.veryStrong;
    case AppStrings.HIGH:
      return AppStrings.strong;
    case AppStrings.MEDIUM:
      return AppStrings.normal;
    case AppStrings.LOW:
      return AppStrings.weak;
    case AppStrings.NONE:
      return AppStrings.none;
    default:
      return "";
  }
}
