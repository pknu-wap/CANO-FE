import 'package:cano/desginsystem/colors.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:cano/view/widget/custom_button.dart';
import 'package:cano/viewmodel/user_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CoffeePreferenceScreen extends ConsumerWidget {
  const CoffeePreferenceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoProvider);

    ref.listen(userInfoProvider, (prev, next) {
      print("현재 상태: $next");
    });

    return Scaffold(
        body: Column(
      children: [
        const SizedBox(height: 65),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "${userInfo.name}${AppStrings.coffeePreferenceText}",
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
        const SizedBox(height: 35),
        Expanded(child: SizedBox()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              text: AppStrings.prev,
              width: 170,
              height: 55,
              buttonColor: Colors.white,
              textColor: Colors.black,
              onPressed: () {
                context.pop();
              },
            ),
            CustomButton(
              onPressed: () {
                if (userInfo.coffees.isNotEmpty) {
                  context.push('/home');
                }
              },
              buttonColor: userInfo.coffees.isNotEmpty
                  ? AppColors.primary
                  : Colors.black26,
              text: AppStrings.next,
              width: 170,
              height: 55,
            )
          ],
        ),
        SizedBox(height: 30),
      ],
    ));
  }
}
