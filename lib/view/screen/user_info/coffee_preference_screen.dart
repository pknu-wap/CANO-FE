import 'package:cano/desginsystem/strings.dart';
import 'package:cano/view/widget/custom_button.dart';
import 'package:cano/view/widget/progress_bar.dart';
import 'package:cano/viewmodel/user_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CoffeePreferenceScreen extends ConsumerWidget {
  const CoffeePreferenceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoProvider);
    final List<String> coffeLabels = [
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
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(height: 65),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: ProgressBar(percent: 0.5)),
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  AppStrings.coffeePreferenceText,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(AppStrings.applyPreferenceInfoText,
                    style: TextStyle(color: Colors.black26, fontSize: 12)),
              ),
            ),
            const SizedBox(height: 35),
            for (var label in coffeLabels)
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30, bottom: 10),
                  child: CustomButton2(
                    text: label,
                    width: 170,
                    height: 40,
                    borderRadius: 70,
                    isSelected: userInfo.coffees.contains(label),
                    onPressed: () {
                      var isSelcted = userInfo.coffees.contains(label);
                      if (isSelcted)
                        ref
                            .watch(userInfoProvider.notifier)
                            .removeCoffee(label);
                      else
                        ref.watch(userInfoProvider.notifier).addCoffee(label);
                    },
                  )),
            const SizedBox(height: 160),
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
                    // keyword로 이동 적용
                    if (userInfo.coffees.isNotEmpty) {
                      context.push('/keyword_preference');
                    }
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
