import 'package:cano/desginsystem/colors.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:cano/view/widget/custom_button.dart';
import 'package:cano/view/widget/progress_bar.dart';
import 'package:cano/viewmodel/user_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class KeywordPreferenceScreen extends ConsumerWidget {
  const KeywordPreferenceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoProvider);
    final List<String> kewordLabels = [
      AppStrings.niceMood,
      AppStrings.parkingLot,
      AppStrings.dessert,
      AppStrings.interior,
      AppStrings.hotPlace,
      AppStrings.highQuality,
      AppStrings.small,
      AppStrings.cheap,
      AppStrings.view,
      AppStrings.special,
      AppStrings.pet,
      AppStrings.newOpen,
      AppStrings.family,
      AppStrings.cozy,
      AppStrings.noKids,
      AppStrings.busan,
    ];

    ref.listen(userInfoProvider, (prev, next) {
      print("현재 상태: \$next");
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 65),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: ProgressBar(percent: 0.75),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                AppStrings.keywordPreferenceText,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 5),
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
          // 키워드 버튼들
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              // Wrap Layout
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: kewordLabels.map((keyword) {
                  final isSelected = userInfo.keywords.contains(keyword);
                  // ChoiceChip
                  return ChoiceChip(
                    // 버튼 스타일 조정
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48)),
                    side:
                        const BorderSide(color: AppColors.primary, width: 1.0),
                    label: Text(
                      keyword,
                      style: TextStyle(
                        color: isSelected ? Colors.white : AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        ref.read(userInfoProvider.notifier).addKeyword(keyword);
                      } else {
                        ref
                            .read(userInfoProvider.notifier)
                            .removeKeyword(keyword);
                      }
                    },
                    selectedColor: AppColors.primary,
                    backgroundColor: Colors.white,
                    showCheckmark: false,
                  );
                }).toList(),
              ),
            ),
          ),
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
                  // 여기 다음화면으로 이동 코드
                  // keyword로 이동 적용
                  if (userInfo.keywords.isNotEmpty) {
                    context.push('/location_preference');
                  }
                },
                buttonColor: userInfo.keywords.isNotEmpty
                    ? AppColors.primary
                    : Colors.black26,
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
