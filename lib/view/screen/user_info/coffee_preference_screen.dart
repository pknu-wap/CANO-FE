import 'package:cano/desginsystem/strings.dart';
import 'package:cano/utils/mediaquery.dart';
import 'package:cano/viewmodel/user_info/user_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../desginsystem/colors.dart';
import '../../widget/custom_button.dart';

class CoffeePreferenceScreen extends ConsumerWidget {
  const CoffeePreferenceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoProvider);

    ref.listen(userInfoProvider, (prev, next) {
      print("현재 상태: $next");
    });

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 65),
          Text(
            "${userInfo.name}${AppStrings.coffeePreferenceText}",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(AppStrings.interestRecommendationText,
              style: TextStyle(color: Colors.black26, fontSize: 12)),
          Text(
            AppStrings.acidity,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            AppStrings.coffeeTasteModifiableText,
            style: TextStyle(color: Colors.black26, fontSize: 12),
          ),
          Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                  text: AppStrings.prev,
                  width: mediaWidth(context, 0.4),
                  height: 55,
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                  onPressed: () {
                    context.pop();
                  }),
              CustomButton(
                onPressed: () {
                  context.push('/home');
                },
                buttonColor: AppColors.primary,
                text: AppStrings.finish,
                width: mediaWidth(context, 0.4),
                height: 55,
              )
            ],
          ),
          SizedBox(height: 30),
        ],
      ),
    ));
  }
}
