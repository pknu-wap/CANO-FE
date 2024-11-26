import 'package:cano/desginsystem/strings.dart';
import 'package:cano/viewmodel/my_page/my_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../desginsystem/colors.dart';
import '../../../utils/mediaquery.dart';
import '../../widget/custom_button.dart';

class MyPageScreen extends ConsumerStatefulWidget {
  const MyPageScreen({super.key});

  @override
  _MyPageScreenState createState() => _MyPageScreenState();
}

class _MyPageScreenState extends ConsumerState<MyPageScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(myPageProvider.notifier).getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    final userResponse = ref.watch(myPageProvider);

    ref.listen(myPageProvider, (prev, next) {
      print("현재 상태: ${next}");
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 65),
          if (userResponse.profileImageUrl != null)
            ClipOval(
                child: Image.network(
              userResponse.profileImageUrl!,
              width: 90,
              height: 90,
              fit: BoxFit.fill,
            ))
          else
            SvgPicture.asset("assets/images/default_user_profile"),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black12),
              child: Text(
                userResponse.name!,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 65),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    AppStrings.logout,
                    style: TextStyle(color: Colors.black26, fontSize: 13),
                  ),
                ),
                Text("ㅣ",
                    style: TextStyle(color: Colors.black26, fontSize: 13)),
                TextButton(
                  onPressed: () {
                    context.push('/modify_user_profile');
                  },
                  child: Text(
                    AppStrings.modify,
                    style: TextStyle(color: Colors.black26, fontSize: 13),
                  ),
                ),
                Text("ㅣ",
                    style: TextStyle(color: Colors.black26, fontSize: 13)),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    AppStrings.withDrawal,
                    style: TextStyle(color: Colors.black26, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            height: 1,
            color: Colors.black,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "${userResponse.name}${AppStrings.forTaste}",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                Text(
                  AppStrings.acidity,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 65,
                ),
                userResponse.acidity != null
                    ? Container(
                        width: mediaWidth(context, 0.5),
                        height: 15,
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor:
                              _IntensityLevelToDouble(userResponse.acidity),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      )
                    : Text(AppStrings.none)
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                Text(
                  AppStrings.body,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  width: 50,
                ),
                userResponse.body != null
                    ? Container(
                        width: mediaWidth(context, 0.5),
                        height: 15,
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor:
                              _IntensityLevelToDouble(userResponse.body),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      )
                    : Text(AppStrings.none)
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                Text(
                  AppStrings.sweetness,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 50,
                ),
                userResponse.sweetness != null
                    ? Container(
                        width: mediaWidth(context, 0.5),
                        height: 15,
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor:
                              _IntensityLevelToDouble(userResponse.sweetness),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      )
                    : Text(AppStrings.none)
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Row(
              children: [
                Text(
                  AppStrings.bitterness,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  width: 65,
                ),
                userResponse.acidity != null
                    ? Container(
                        width: mediaWidth(context, 0.5),
                        height: 15,
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor:
                              _IntensityLevelToDouble(userResponse.bitterness),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      )
                    : Text(AppStrings.none)
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Row(
              children: [
                Text(
                  AppStrings.aroma,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(AppStrings.none)
                // Text(joinWithComma(userResponse.))
              ],
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: CustomButton(
              text: AppStrings.modifyCoffeTaste,
              height: 40,
              textColor: Colors.white,
              buttonColor: AppColors.primary,
              onPressed: () {
                context.push('/modify_user_profile');
              },
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

double _IntensityLevelToDouble(String? intensity) {
  switch (intensity) {
    case AppStrings.NONE:
      return 0;
    case AppStrings.LOW:
      return 0.25;
    case AppStrings.MEDIUM:
      return 0.5;
    case AppStrings.HIGH:
      return 0.75;
    case AppStrings.VERY_HIGH:
      return 1;
    default:
      return 0;
  }
}
