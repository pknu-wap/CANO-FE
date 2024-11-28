// write_review_screen.dart
import 'dart:io';

import 'package:cano/data/model/submit_review/review_info.dart';
import 'package:cano/desginsystem/colors.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:cano/viewmodel/submit_review/review_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WriteReviewScreen extends ConsumerWidget {
  const WriteReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewState = ref.watch(reviewViewModelProvider);
    final reviewViewModel = ref.read(reviewViewModelProvider.notifier);

    print(
        "리뷰: ${reviewState.score}, ${reviewState.contents.toString()}, ${reviewState.acidity}, ${reviewState.body}, ${reviewState.bitterness}, ${reviewState.sweetness}, ${reviewState.aroma}");

    final List<String> intensities =
        IntensityLevel.values.map((level) => level.value).toList();
    final List<String> aromas =
        Aroma.values.map((aroma) => aroma.scent).toList();

    IntensityLevel? getIntensityLevel(String description) {
      return IntensityLevel.values.firstWhere(
        (level) => level.value == description,
        orElse: () => IntensityLevel.none, // none 반환
      );
    }

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
                          reviewViewModel.setScore(i.toDouble());
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
                    reviewViewModel.setContents(text);
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
                    for (int i = 0; i < reviewState.imageUrls!.length; i++)
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    FileImage(File(reviewState.imageUrls![i])),
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
                              onPressed: () => reviewViewModel.removeImage(i),
                            ),
                          ),
                        ],
                      ),
                    if (reviewState.imageUrls!.length < 2)
                      GestureDetector(
                        onTap: reviewViewModel.addImage,
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
                  children: intensities.map((description) {
                    final intensityLevel = getIntensityLevel(description);
                    return ChoiceChip(
                      showCheckmark: false,
                      label: Text(
                        description,
                        style: const TextStyle(fontSize: 11),
                      ),
                      selected: reviewState.acidity == intensityLevel,
                      onSelected: (bool selected) {
                        reviewViewModel
                            .setAcidity(selected ? intensityLevel : null);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: reviewState.acidity == intensityLevel
                              ? AppColors.selectedColor
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: reviewState.acidity == intensityLevel
                            ? AppColors.selectedColor
                            : Colors.grey,
                      ),
                    );
                  }).toList(),
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
                  children: intensities.map((description) {
                    final intensityLevel = getIntensityLevel(description);
                    return ChoiceChip(
                      showCheckmark: false,
                      label: Text(
                        description,
                        style: const TextStyle(fontSize: 11),
                      ),
                      selected: reviewState.body == intensityLevel,
                      onSelected: (bool selected) {
                        reviewViewModel
                            .setBody(selected ? intensityLevel : null);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: reviewState.body == intensityLevel
                              ? AppColors.selectedColor
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: reviewState.body == intensityLevel
                            ? AppColors.selectedColor
                            : Colors.grey,
                      ),
                    );
                  }).toList(),
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
                  children: intensities.map((description) {
                    final intensityLevel = getIntensityLevel(description);
                    return ChoiceChip(
                      showCheckmark: false,
                      label: Text(
                        description,
                        style: const TextStyle(fontSize: 11),
                      ),
                      selected: reviewState.bitterness == intensityLevel,
                      onSelected: (bool selected) {
                        reviewViewModel
                            .setBitterness(selected ? intensityLevel : null);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: reviewState.bitterness == intensityLevel
                              ? AppColors.selectedColor
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: reviewState.bitterness == intensityLevel
                            ? AppColors.selectedColor
                            : Colors.grey,
                      ),
                    );
                  }).toList(),
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
                  children: intensities.map((description) {
                    final intensityLevel = getIntensityLevel(description);
                    return ChoiceChip(
                      showCheckmark: false,
                      label: Text(
                        description,
                        style: const TextStyle(fontSize: 11),
                      ),
                      selected: reviewState.sweetness == intensityLevel,
                      onSelected: (bool selected) {
                        reviewViewModel
                            .setSweetness(selected ? intensityLevel : null);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: reviewState.sweetness == intensityLevel
                              ? AppColors.selectedColor
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: reviewState.sweetness == intensityLevel
                            ? AppColors.selectedColor
                            : Colors.grey,
                      ),
                    );
                  }).toList(),
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
                  children: aromas.map((scent) {
                    final aroma =
                        Aroma.values.firstWhere((a) => a.scent == scent);
                    return ChoiceChip(
                      showCheckmark: false,
                      label: Text(
                        scent,
                        style: const TextStyle(fontSize: 11),
                      ),
                      selected: reviewState.aroma!.contains(aroma),
                      onSelected: (bool selected) {
                        reviewViewModel.toggleAroma(aroma);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: reviewState.aroma!.contains(aroma)
                              ? AppColors.selectedColor
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: reviewState.aroma!.contains(aroma)
                            ? AppColors.selectedColor
                            : Colors.grey,
                      ),
                    );
                  }).toList(),
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
                        final reviewText = reviewState.contents.trim();

                        final List<String> reviewImageUrls =
                            reviewState.imageUrls!.isNotEmpty
                                ? reviewState.imageUrls!
                                    .map((path) => 'file://$path')
                                    .toList()
                                : [];

                        final newReview = ReviewInfo(
                          id: reviewState.id,
                          memberName: reviewState.memberName,
                          score: reviewState.score,
                          createdAt: reviewState.createdAt,
                          contents: reviewText,
                          imageUrls: reviewImageUrls,
                          acidity: reviewState.acidity,
                          body: reviewState.body,
                          bitterness: reviewState.bitterness,
                          sweetness: reviewState.sweetness,
                          aroma: reviewState.aroma!.isNotEmpty
                              ? reviewState.aroma
                              : null,
                        );

                        
                          ref.read(reviewViewModelProvider.notifier).submitReview(newReview);


                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(AppStrings.submitReviewAlert)),
                        );

                        Navigator.pop(context);
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
