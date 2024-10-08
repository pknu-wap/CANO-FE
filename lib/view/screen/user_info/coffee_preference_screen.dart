import 'package:cano/desginsystem/strings.dart';
import 'package:cano/view/widget/custom_button.dart';
import 'package:cano/view/widget/progress_bar.dart';
import 'package:cano/viewmodel/user_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CoffeePreferenceScreen extends ConsumerWidget {
  CoffeePreferenceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoProvider);
    final List<String> coffeeLables = [
      AppStrings.americano,
      AppStrings.espresso,
      AppStrings.cappuccino,
      AppStrings.caffemoca,
      AppStrings.caffelatte,
      AppStrings.caramelMacchiato
    ];

    ref.listen(userInfoProvider, (prev, next) {
      print("현재 상태: $next");
    });

    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: 65),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ProgressBar(percent: 0.5)),
        SizedBox(height: 70),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              AppStrings.coffeePreferenceText,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(AppStrings.coffeePreferenceInfoText,
                style: TextStyle(color: Colors.black26, fontSize: 12)),
          ),
        ),
        SizedBox(height: 35),
        for (var lable in coffeeLables)
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 30, bottom: 10),
              child: CustomButton2(
                text: lable,
                width: 170,
                height: 40,
                borderRadius: 70,
                isSelected: userInfo.coffees.contains(lable),
                onPressed: () {
                  var isSelcted = userInfo.coffees.contains(lable);
                  if (isSelcted)
                    ref.watch(userInfoProvider.notifier).removeCoffee(lable);
                  else
                    ref.watch(userInfoProvider.notifier).addCoffee(lable);
                },
              )),
        SizedBox(height: 160),
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
                // 여기 다음화면으로 이동 코드
              },
              text: AppStrings.next,
              width: 170,
              height: 55,
            )
          ],
        ),
      ],
    ));
  }
}
