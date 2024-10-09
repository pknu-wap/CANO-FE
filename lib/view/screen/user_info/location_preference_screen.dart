import 'package:cano/desginsystem/colors.dart';
import 'package:cano/view/widget/progress_bar.dart';
import 'package:cano/viewmodel/user_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:cano/view/widget/custom_button.dart';

class LocationPreferenceScreen extends ConsumerWidget {
  const LocationPreferenceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoProvider);
    final List<String> provinces = [
      AppStrings.seoul,
      AppStrings.gyeongggi,
      AppStrings.incheon,
      AppStrings.gangwon,
      AppStrings.sejong,
      AppStrings.chungbuk,
      AppStrings.chungnam,
      AppStrings.busan,
      AppStrings.daegu,
      AppStrings.ulsan,
      AppStrings.kyungbuk,
      AppStrings.kyungnam,
      AppStrings.jeonbuk,
      AppStrings.jeonnam,
      AppStrings.jeju,
    ];

    final String selectedArea = userInfo.area;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 65),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: ProgressBar(percent: 0.9),
          ),
          const SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                AppStrings.areaPreferenceText,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                AppStrings.applyPreferenceInfoText,
                style: TextStyle(color: Colors.black26, fontSize: 12),
              ),
            ),
          ),
          const SizedBox(height: 35),
          // 지역 버튼들
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: provinces.map((province) {
                  final isSelected = selectedArea == province;
                  return ChoiceChip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48),
                    ),
                    side:
                        const BorderSide(color: AppColors.primary, width: 1.0),
                    label: Text(
                      province,
                      style: TextStyle(
                        color: isSelected ? Colors.white : AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (selected) {
                      ref
                          .read(userInfoProvider.notifier)
                          .setArea(selected ? province : '');
                    },
                    selectedColor: AppColors.primary,
                    backgroundColor: Colors.white,
                    showCheckmark: false,
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 30),
          // 이전, 다음 버튼
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
                  if (selectedArea.isNotEmpty) {
                    context.push('/welcome');
                  }
                },
                text: AppStrings.next,
                width: 170,
                height: 55,
              )
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
