// write_review_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cano/desginsystem/colors.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cano/viewmodel/review/review_viewmodel.dart';
import 'package:cano/data/model/review/review_info.dart';

class WriteReviewScreen extends ConsumerWidget {
  const WriteReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewViewModel = ref.watch(reviewViewModelProvider.notifier);
    final rating = reviewViewModel.rating;
    final List<String> intensities =
        IntensityLevel.values.map((level) => level.description).toList();
    final List<String> aromas =
        Aroma.values.map((aroma) => aroma.scent).toList();

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
                        onTap: () async {
                          reviewViewModel.setRating(i.toDouble());
                        },
                        child: Icon(
                          Icons.star,
                          color: i <= rating
                              ? AppColors.star
                              : AppColors.emptyStar,
                          size: 28,
                        ),
                      ),
                    const SizedBox(width: 8),
                    Text(
                      '${rating.toInt()}/5',
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
                  controller: reviewViewModel.reviewController,
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
                    for (int i = 0;
                        i < reviewViewModel.uploadedImagePaths.length;
                        i++)
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(File(
                                    reviewViewModel.uploadedImagePaths[i])),
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
                    if (reviewViewModel.uploadedImagePaths.length < 2)
                      GestureDetector(
                        onTap: () async {
                          await reviewViewModel.addImage();
                        },
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
                      List<Widget>.generate(intensities.length, (int index) {
                    return ChoiceChip(
                      showCheckmark: false,
                      label: Text(
                        intensities[index],
                        style: const TextStyle(fontSize: 11),
                      ),
                      selected: reviewViewModel.selectedAcidity ==
                          reviewViewModel.getIntensityLevel(intensities[index]),
                      onSelected: (bool selected) {
                        reviewViewModel.selectedAcidity = selected
                            ? reviewViewModel
                                .getIntensityLevel(intensities[index])
                            : null;
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: reviewViewModel.selectedAcidity ==
                                  reviewViewModel
                                      .getIntensityLevel(intensities[index])
                              ? AppColors.selectedColor
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: reviewViewModel.selectedAcidity ==
                                reviewViewModel
                                    .getIntensityLevel(intensities[index])
                            ? AppColors.selectedColor
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 15),
                // Body Section
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
                      List<Widget>.generate(intensities.length, (int index) {
                    return ChoiceChip(
                      showCheckmark: false,
                      label: Text(
                        intensities[index],
                        style: const TextStyle(fontSize: 11),
                      ),
                      selected: reviewViewModel.selectedBody ==
                          reviewViewModel.getIntensityLevel(intensities[index]),
                      onSelected: (bool selected) {
                        reviewViewModel.selectedBody = selected
                            ? reviewViewModel
                                .getIntensityLevel(intensities[index])
                            : null;
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: reviewViewModel.selectedBody ==
                                  reviewViewModel
                                      .getIntensityLevel(intensities[index])
                              ? AppColors.selectedColor
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: reviewViewModel.selectedBody ==
                                reviewViewModel
                                    .getIntensityLevel(intensities[index])
                            ? AppColors.selectedColor
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 15),
                // Bitterness Section
                const Text(
                  AppStrings.bitterness,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Wrap(
                  spacing: 8,
                  runSpacing: -5,
                  children:
                      List<Widget>.generate(intensities.length, (int index) {
                    return ChoiceChip(
                      showCheckmark: false,
                      label: Text(
                        intensities[index],
                        style: const TextStyle(fontSize: 11),
                      ),
                      selected: reviewViewModel.selectedBitterness ==
                          reviewViewModel.getIntensityLevel(intensities[index]),
                      onSelected: (bool selected) {
                        reviewViewModel.selectedBitterness = selected
                            ? reviewViewModel
                                .getIntensityLevel(intensities[index])
                            : null;
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: reviewViewModel.selectedBitterness ==
                                  reviewViewModel
                                      .getIntensityLevel(intensities[index])
                              ? AppColors.selectedColor
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: reviewViewModel.selectedBitterness ==
                                reviewViewModel
                                    .getIntensityLevel(intensities[index])
                            ? AppColors.selectedColor
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 15),
                // Sweetness Section
                const Text(
                  AppStrings.sweetness,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Wrap(
                  spacing: 8,
                  runSpacing: -5,
                  children:
                      List<Widget>.generate(intensities.length, (int index) {
                    return ChoiceChip(
                      showCheckmark: false,
                      label: Text(
                        intensities[index],
                        style: const TextStyle(fontSize: 11),
                      ),
                      selected: reviewViewModel.selectedSweetness ==
                          reviewViewModel.getIntensityLevel(intensities[index]),
                      onSelected: (bool selected) {
                        reviewViewModel.selectedSweetness = selected
                            ? reviewViewModel
                                .getIntensityLevel(intensities[index])
                            : null;
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: reviewViewModel.selectedSweetness ==
                                  reviewViewModel
                                      .getIntensityLevel(intensities[index])
                              ? AppColors.selectedColor
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: reviewViewModel.selectedSweetness ==
                                reviewViewModel
                                    .getIntensityLevel(intensities[index])
                            ? AppColors.selectedColor
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 15),
                // Aroma Section
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
                    Aroma aroma = Aroma.values[index];
                    return ChoiceChip(
                      showCheckmark: false,
                      label: Text(
                        aromas[index],
                        style: const TextStyle(fontSize: 11),
                      ),
                      selected: reviewViewModel.selectedAromas.contains(aroma),
                      onSelected: (bool selected) {
                        if (selected) {
                          reviewViewModel.selectedAromas.add(aroma);
                        } else {
                          reviewViewModel.selectedAromas.remove(aroma);
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: reviewViewModel.selectedAromas.contains(aroma)
                              ? AppColors.selectedColor
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: reviewViewModel.selectedAromas.contains(aroma)
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
                    height: 54, // Fixed height for consistency
                    margin: const EdgeInsets.only(bottom: 24),
                    child: ElevatedButton(
                      onPressed: () async {
                        final reviewText =
                            reviewViewModel.reviewController.text.trim();

                        final List<String> reviewImageUrls =
                            reviewViewModel.uploadedImagePaths.isNotEmpty
                                ? reviewViewModel.uploadedImagePaths
                                    .map((path) => 'file://$path')
                                    .toList()
                                : [];

                        final newReview = ReviewInfo(
                          userName: '현재 유저', // 현재 유저 이름으로 변경
                          rating: rating.toString(),
                          timestamp: DateTime.now(),
                          reviewText: reviewText,
                          reviewImageUrl: reviewImageUrls,
                          acidity: reviewViewModel.selectedAcidity,
                          body: reviewViewModel.selectedBody,
                          bitterness: reviewViewModel.selectedBitterness,
                          sweetness: reviewViewModel.selectedSweetness,
                          aroma: reviewViewModel.selectedAromas.isNotEmpty
                              ? reviewViewModel.selectedAromas
                              : null,
                        );

                        // Add the new review to the provider
                        ref
                            .read(reviewViewModelProvider.notifier)
                            .addReview(newReview);

                        // Optionally, show a success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(AppStrings.submitReviewAlert)),
                        );

                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: rating == 0
                            ? Colors.grey
                            : AppColors.floatingButton,
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
