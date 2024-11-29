// write_review_screen.dart
import 'dart:io';

import 'package:cano/desginsystem/colors.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:cano/viewmodel/submit_review/review_viewmodel.dart';
import 'package:cano/viewmodel/users_review/users_review_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../data/model/user_info/user_info.dart';
import '../../../utils/view/dialog.dart';
import '../../../utils/view/show_toast.dart';

class WriteReviewScreen extends ConsumerWidget {
  final int menuId;
  const WriteReviewScreen({super.key, required this.menuId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewState = ref.watch(reviewViewModelProvider);
    final writeAvailable =
        reviewState.score != 0.0 && reviewState.contents != "";

    final intensitys =
        Intensitylevel.values.map((level) => level.description).toList();
    final aromas = Aroma.values.map((aroma) => aroma.scent).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Text(
                  AppStrings.howIsCoffee,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                // Rating Section
                const Text(
                  AppStrings.wholeRating,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    for (int i = 1; i <= 5; i++)
                      GestureDetector(
                        onTap: () {
                          ref
                              .read(reviewViewModelProvider.notifier)
                              .setScore(i.toDouble());
                        },
                        child: Icon(
                          Icons.star,
                          color: i <= reviewState.score
                              ? AppColors.star
                              : AppColors.emptyStar,
                          size: 28,
                        ),
                      ),
                    const SizedBox(width: 8),
                    Text(
                      '${reviewState.score.toInt()}/5',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // 리뷰 텍스트
                TextField(
                  style: const TextStyle(fontSize: 14),
                  onChanged: (text) {
                    ref
                        .read(reviewViewModelProvider.notifier)
                        .setContents(text);
                  },
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: AppStrings.reviewHint,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.barBorder),
                    ),
                    hintStyle: const TextStyle(
                      fontSize: 12,
                    ),
                    filled: true,
                    fillColor: AppColors.barBg,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.barBorder),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.barBorder),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  AppStrings.uploadPhoto,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    for (int i = 0; i < reviewState.images!.length; i++)
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(File(reviewState.images![i])),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Colors.grey),
                            ),
                          ),
                          Positioned(
                            top: -10,
                            right: -3,
                            child: IconButton(
                              icon: const Icon(
                                Icons.cancel,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () => ref
                                  .read(reviewViewModelProvider.notifier)
                                  .removeImage(i),
                            ),
                          ),
                        ],
                      ),
                    if (reviewState.images!.length < 2)
                      GestureDetector(
                        onTap:
                            ref.read(reviewViewModelProvider.notifier).addImage,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColors.barBg,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: AppColors.barBorder),
                          ),
                          child: const Icon(Icons.add),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),

                // Acidity
                Row(
                  children: [
                    const Text(
                      AppStrings.acidity,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    Tooltip(
                      message: AppStrings.acidityDescription,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      preferBelow: false,
                      verticalOffset: 0,
                      triggerMode: TooltipTriggerMode.tap,
                      margin: const EdgeInsets.only(left: 40, top: 40),
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 12),
                      showDuration: const Duration(seconds: 3),
                      waitDuration: const Duration(seconds: 1),
                      child: SvgPicture.asset(
                        "assets/images/info_icon.svg",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Wrap(
                  spacing: 8,
                  runSpacing: -5,
                  children:
                      List<Widget>.generate(intensitys.length, (int index) {
                    return ChoiceChip(
                      showCheckmark: false,
                      label: Text(
                        intensitys[index],
                        style: TextStyle(fontSize: 11),
                      ),
                      selected:
                          reviewState.acidity?.description == intensitys[index],
                      onSelected: (bool selected) {
                        ref
                            .read(reviewViewModelProvider.notifier)
                            .setAcidity(intensitys[index]);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: reviewState.acidity?.description ==
                                    intensitys[index]
                                ? AppColors.selectedColor
                                : Colors.grey,
                            width: 1,
                          )),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: reviewState.acidity?.description ==
                                intensitys[index]
                            ? AppColors.selectedColor
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 15),

                // Body
                Row(
                  children: [
                    const Text(
                      AppStrings.body,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    Tooltip(
                      message: AppStrings.bodyDescription,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      preferBelow: false,
                      verticalOffset: 0,
                      triggerMode: TooltipTriggerMode.tap,
                      margin: const EdgeInsets.only(left: 40, top: 40),
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 12),
                      showDuration: const Duration(seconds: 3),
                      waitDuration: const Duration(seconds: 1),
                      child: SvgPicture.asset(
                        "assets/images/info_icon.svg",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Wrap(
                  spacing: 8,
                  runSpacing: -5,
                  children:
                      List<Widget>.generate(intensitys.length, (int index) {
                    return ChoiceChip(
                      showCheckmark: false,
                      label: Text(intensitys[index],
                          style: TextStyle(fontSize: 11)),
                      selected:
                          reviewState.body?.description == intensitys[index],
                      onSelected: (bool selected) {
                        ref
                            .read(reviewViewModelProvider.notifier)
                            .setBody(intensitys[index]);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: reviewState.body?.description ==
                                    intensitys[index]
                                ? AppColors.selectedColor
                                : Colors.grey,
                            width: 1,
                          )),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color:
                            reviewState.body?.description == intensitys[index]
                                ? AppColors.selectedColor
                                : Colors.grey,
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 15),

                // Bitterness
                const Text(
                  AppStrings.bitterness,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Wrap(
                  spacing: 8,
                  runSpacing: -5,
                  children:
                      List<Widget>.generate(intensitys.length, (int index) {
                    return ChoiceChip(
                      showCheckmark: false,
                      label: Text(intensitys[index],
                          style: TextStyle(fontSize: 11)),
                      selected: reviewState.bitterness?.description ==
                          intensitys[index],
                      onSelected: (bool selected) {
                        ref
                            .read(reviewViewModelProvider.notifier)
                            .setBitterness(intensitys[index]);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: reviewState.bitterness?.description ==
                                    intensitys[index]
                                ? AppColors.selectedColor
                                : Colors.grey,
                            width: 1,
                          )),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: reviewState.bitterness?.description ==
                                intensitys[index]
                            ? AppColors.selectedColor
                            : Colors.grey,
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 15),

                // Sweetness
                const Text(
                  AppStrings.sweetness,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Wrap(
                  spacing: 8,
                  runSpacing: -5,
                  children:
                      List<Widget>.generate(intensitys.length, (int index) {
                    return ChoiceChip(
                      showCheckmark: false,
                      label: Text(intensitys[index],
                          style: TextStyle(fontSize: 11)),
                      selected: reviewState.sweetness?.description ==
                          intensitys[index],
                      onSelected: (bool selected) {
                        ref
                            .read(reviewViewModelProvider.notifier)
                            .setSweetness(intensitys[index]);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: reviewState.sweetness?.description ==
                                    intensitys[index]
                                ? AppColors.selectedColor
                                : Colors.grey,
                            width: 1,
                          )),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: reviewState.sweetness?.description ==
                                intensitys[index]
                            ? AppColors.selectedColor
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 15),

                // Aroma
                Row(
                  children: [
                    const Text(
                      AppStrings.aroma,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    Tooltip(
                      message: AppStrings.aromaDescription,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      preferBelow: false,
                      verticalOffset: 0,
                      triggerMode: TooltipTriggerMode.tap,
                      margin: const EdgeInsets.only(left: 40, top: 40),
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 12),
                      showDuration: const Duration(seconds: 3),
                      waitDuration: const Duration(seconds: 1),
                      child: SvgPicture.asset(
                        "assets/images/info_icon.svg",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Wrap(
                  spacing: 8,
                  runSpacing: -5,
                  children: List<Widget>.generate(aromas.length, (int index) {
                    return ChoiceChip(
                      showCheckmark: false,
                      label:
                          Text(aromas[index], style: TextStyle(fontSize: 11)),
                      selected: reviewState.aroma
                          .contains(Aroma.fromString(aromas[index])),
                      onSelected: (bool selected) {
                        ref
                            .read(reviewViewModelProvider.notifier)
                            .toggleAroma(aromas[index]);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: reviewState.aroma
                                    .contains(Aroma.fromString(aromas[index]))
                                ? AppColors.selectedColor
                                : Colors.grey,
                            width: 1,
                          )),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: reviewState.aroma
                                .contains(Aroma.fromString(aromas[index]))
                            ? AppColors.selectedColor
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 32),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 54,
                    margin: const EdgeInsets.only(bottom: 24),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (writeAvailable) {
                          showDoubleButtonAlertDialog(
                              context, "메뉴 등록", AppStrings.askToWriteReview,
                              onConfirm: () async {
                            final isSuccess = await ref
                                .read(reviewViewModelProvider.notifier)
                                .submitReview(menuId);

                            if (isSuccess) {
                              context.pop();
                              ref
                                  .read(usersReviewViewModelProvider.notifier)
                                  .fetchReviews(menuId);
                              showToast(AppStrings.submitReviewSuccess);
                            } else {
                              showToast(AppStrings.submitReviewFailure);
                            }
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: reviewState.score != 0 &&
                                reviewState.contents.isNotEmpty
                            ? AppColors.floatingButton
                            : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/reviewPencil.svg"),
                          const SizedBox(width: 8),
                          const Text(
                            AppStrings.writeReview,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
