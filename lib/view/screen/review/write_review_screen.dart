import 'dart:io';
import 'package:cano/data/model/review/review_info.dart';
import 'package:cano/desginsystem/colors.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:cano/viewmodel/review/review_viewmodel.dart';
import 'package:cano/data/model/review/review_info.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cano/view/widget/grey_textfield.dart';

class WriteReviewScreen extends ConsumerStatefulWidget {
  WriteReviewScreen({super.key});


class WriteReviewScreen extends ConsumerWidget {
  const WriteReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewState = ref.watch(reviewViewModelProvider);
    final reviewViewModel = ref.read(reviewViewModelProvider.notifier);

    print(reviewState.reviewText);

    final List<String> intensities =
        IntensityLevel.values.map((level) => level.description).toList();
    final List<String> aromas =
        Aroma.values.map((aroma) => aroma.scent).toList();

    IntensityLevel? getIntensityLevel(String description) {
      return IntensityLevel.values.firstWhere(
        (level) => level.description == description,
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
                          reviewViewModel.setRating(i.toDouble());
                        },
                        child: Icon(
                          Icons.star,
                          color: i <= reviewState.rating
                              ? AppColors.star
                              : AppColors.emptyStar,
                          size: 28,
                        ),
                      ),
                    const SizedBox(width: 8),
                    Text(
                      '${reviewState.rating.toInt()}/5',
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
                    reviewViewModel.setReviewText(text);
                  },
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: AppStrings.reviewHint,
                    textController: reviewController),
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
                        i < reviewState.uploadedImagePaths.length;
                        i++)
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(
                                    File(reviewState.uploadedImagePaths[i])),
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
                    if (reviewState.uploadedImagePaths.length < 2)
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
                      selected: reviewState.selectedAcidity == intensityLevel,
                      onSelected: (bool selected) {
                        reviewViewModel.setSelectedAcidity(
                            selected ? intensityLevel : null);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: reviewState.selectedAcidity == intensityLevel
                              ? AppColors.selectedColor
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: reviewState.selectedAcidity == intensityLevel
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
                      selected: reviewState.selectedBody == intensityLevel,
                      onSelected: (bool selected) {
                        reviewViewModel
                            .setSelectedBody(selected ? intensityLevel : null);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: reviewState.selectedBody == intensityLevel
                              ? AppColors.selectedColor
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: reviewState.selectedBody == intensityLevel
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
                      selected:
                          reviewState.selectedBitterness == intensityLevel,
                      onSelected: (bool selected) {
                        reviewViewModel.setSelectedBitterness(
                            selected ? intensityLevel : null);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color:
                              reviewState.selectedBitterness == intensityLevel
                                  ? AppColors.selectedColor
                                  : Colors.grey,
                          width: 1,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: reviewState.selectedBitterness == intensityLevel
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
                      selected: reviewState.selectedSweetness == intensityLevel,
                      onSelected: (bool selected) {
                        reviewViewModel.setSelectedSweetness(
                            selected ? intensityLevel : null);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: reviewState.selectedSweetness == intensityLevel
                              ? AppColors.selectedColor
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: reviewState.selectedSweetness == intensityLevel
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
                      selected: reviewState.selectedAromas.contains(aroma),
                      onSelected: (bool selected) {
                        reviewViewModel.toggleAroma(aroma);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: reviewState.selectedAromas.contains(aroma)
                              ? AppColors.selectedColor
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: reviewState.selectedAromas.contains(aroma)
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
                        final reviewText = reviewState.reviewText.trim();

                        final List<String> reviewImageUrls =
                            reviewState.uploadedImagePaths.isNotEmpty
                                ? reviewState.uploadedImagePaths
                                    .map((path) => 'file://$path')
                                    .toList()
                                : [];

                        final newReview = ReviewInfo(
                          userName: '현재 유저',
                          rating: reviewState.rating.toString(),
                          timestamp: DateTime.now(),
                          reviewText: reviewText,
                          reviewImageUrl: reviewImageUrls,
                          acidity: reviewState.selectedAcidity,
                          body: reviewState.selectedBody,
                          bitterness: reviewState.selectedBitterness,
                          sweetness: reviewState.selectedSweetness,
                          aroma: reviewState.selectedAromas.isNotEmpty
                              ? reviewState.selectedAromas
                              : null,
                        );

                        ref
                            .read(reviewViewModelProvider.notifier)
                            .addReview(newReview);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(AppStrings.submitReviewAlert)),
                        );

                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: reviewState.rating != 0 &&
                                reviewState.reviewText.isNotEmpty
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
