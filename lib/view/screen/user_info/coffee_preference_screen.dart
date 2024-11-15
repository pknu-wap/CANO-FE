import 'package:cano/data/model/user_info/user_info.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:cano/utils/mediaquery.dart';
import 'package:cano/viewmodel/user_info/user_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../desginsystem/colors.dart';
import '../../widget/custom_button.dart';

class CoffeePreferenceScreen extends ConsumerWidget {
  CoffeePreferenceScreen({super.key});

  final intensitys =
      Intensitylevel.values.map((level) => level.description).toList();
  final aromas = Aroma.values.map((aroma) => aroma.scent).toList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoProvider);

    ref.listen(userInfoProvider, (prev, next) {
      print("current State: $next");
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
          SizedBox(
            height: 20,
          ),
          Text(
            AppStrings.acidity,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: List<Widget>.generate(intensitys.length, (int index) {
              return ChoiceChip(
                showCheckmark: false,
                label: Text(intensitys[index]),
                selected: userInfo.acidity?.description == intensitys[index],
                onSelected: (bool selected) {
                  ref
                      .read(userInfoProvider.notifier)
                      .setAcidity(intensitys[index]);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: userInfo.acidity?.description == intensitys[index]
                          ? AppColors.selectedColor
                          : Colors.grey,
                      width: 1,
                    )),
                backgroundColor: Colors.white,
                selectedColor: Colors.white,
                labelStyle: TextStyle(
                  color: userInfo.acidity?.description == intensitys[index]
                      ? AppColors.selectedColor
                      : Colors.grey,
                ),
              );
            }),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            AppStrings.body,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: List<Widget>.generate(intensitys.length, (int index) {
              return ChoiceChip(
                showCheckmark: false,
                label: Text(intensitys[index]),
                selected: userInfo.body?.description == intensitys[index],
                onSelected: (bool selected) {
                  ref
                      .read(userInfoProvider.notifier)
                      .setBody(intensitys[index]);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: userInfo.body?.description == intensitys[index]
                          ? AppColors.selectedColor
                          : Colors.grey,
                      width: 1,
                    )),
                backgroundColor: Colors.white,
                selectedColor: Colors.white,
                labelStyle: TextStyle(
                  color: userInfo.body?.description == intensitys[index]
                      ? AppColors.selectedColor
                      : Colors.grey,
                ),
              );
            }),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            AppStrings.bitterness,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: List<Widget>.generate(intensitys.length, (int index) {
              return ChoiceChip(
                showCheckmark: false,
                label: Text(intensitys[index]),
                selected: userInfo.bitterness?.description == intensitys[index],
                onSelected: (bool selected) {
                  ref
                      .read(userInfoProvider.notifier)
                      .setBitterness(intensitys[index]);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color:
                          userInfo.bitterness?.description == intensitys[index]
                              ? AppColors.selectedColor
                              : Colors.grey,
                      width: 1,
                    )),
                backgroundColor: Colors.white,
                selectedColor: Colors.white,
                labelStyle: TextStyle(
                  color: userInfo.bitterness?.description == intensitys[index]
                      ? AppColors.selectedColor
                      : Colors.grey,
                ),
              );
            }),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            AppStrings.sweetness,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: List<Widget>.generate(intensitys.length, (int index) {
              return ChoiceChip(
                showCheckmark: false,
                label: Text(intensitys[index]),
                selected: userInfo.sweetness?.description == intensitys[index],
                onSelected: (bool selected) {
                  ref
                      .read(userInfoProvider.notifier)
                      .setSweetness(intensitys[index]);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color:
                          userInfo.sweetness?.description == intensitys[index]
                              ? AppColors.selectedColor
                              : Colors.grey,
                      width: 1,
                    )),
                backgroundColor: Colors.white,
                selectedColor: Colors.white,
                labelStyle: TextStyle(
                  color: userInfo.sweetness?.description == intensitys[index]
                      ? AppColors.selectedColor
                      : Colors.grey,
                ),
              );
            }),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            AppStrings.aroma,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: List<Widget>.generate(aromas.length, (int index) {
              return ChoiceChip(
                showCheckmark: false,
                label: Text(aromas[index]),
                selected:
                    userInfo.aroma.contains(Aroma.fromString(aromas[index])),
                onSelected: (bool selected) {
                  ref
                      .read(userInfoProvider.notifier)
                      .toggleAroma(aromas[index]);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: userInfo.aroma
                              .contains(Aroma.fromString(aromas[index]))
                          ? AppColors.selectedColor
                          : Colors.grey,
                      width: 1,
                    )),
                backgroundColor: Colors.white,
                selectedColor: Colors.white,
                labelStyle: TextStyle(
                  color:
                      userInfo.aroma.contains(Aroma.fromString(aromas[index]))
                          ? AppColors.selectedColor
                          : Colors.grey,
                ),
              );
            }),
          ),
          Expanded(child: SizedBox()),
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
                  context.go('/home');
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
