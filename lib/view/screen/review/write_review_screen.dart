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
import 'package:url_launcher/url_launcher.dart';

class WriteReviewScreen extends ConsumerStatefulWidget {
  WriteReviewScreen({super.key});

  final List<String> intensities =
      Intensitylevel.values.map((level) => level.description).toList();
  final List<String> aromas = Aroma.values.map((aroma) => aroma.scent).toList();

  @override
  _WriteReviewScreenState createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends ConsumerState<WriteReviewScreen> {
  double rating = 0.0;
  final TextEditingController reviewController = TextEditingController();
  List<String> uploadedImagePaths = [];
  final ImagePicker picker = ImagePicker();

  // Initialize menu attribute selections
  Intensitylevel? selectedAcidity;
  Intensitylevel? selectedBody;
  Intensitylevel? selectedBitterness;
  Intensitylevel? selectedSweetness;
  List<Aroma> selectedAromas = [];

  Future<void> addImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        uploadedImagePaths.add(pickedFile.path);
      });
    }
  }

  void removeImage(int index) {
    setState(() {
      uploadedImagePaths.removeAt(index);
    });
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Watch the review list provider
    final reviewData = ref.watch(reviewListProvider);

    ref.listen(reviewListProvider, (prev, next) {
      print("현재 상태: $next");
    });

    // Helper function to get Intensitylevel from description
    Intensitylevel? getIntensityLevel(String description) {
      return Intensitylevel.values.firstWhere(
        (level) => level.description == description,
        orElse: () => Intensitylevel.none,
      );
    }

    // Extract intensities and aromas from widget
    final intensities = widget.intensities;
    final aromas = widget.aromas;

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
                          setState(() {
                            rating = i.toDouble();
                          });
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
                // Review TextField
                TextField(
                  style: const TextStyle(fontSize: 14),
                  controller: reviewController,
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
                // Image Upload Section
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
                    for (int i = 0; i < uploadedImagePaths.length; i++)
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(File(uploadedImagePaths[i])),
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
                              onPressed: () => removeImage(i),
                            ),
                          ),
                        ],
                      ),
                    if (uploadedImagePaths.length < 2)
                      GestureDetector(
                        onTap: addImage,
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
                // Menu-Related Choice Chips and Tooltips
                // Acidity Section
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
                      selected: selectedAcidity ==
                          getIntensityLevel(intensities[index]),
                      onSelected: (bool selected) {
                        setState(() {
                          selectedAcidity = selected
                              ? getIntensityLevel(intensities[index])
                              : null;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: selectedAcidity ==
                                  getIntensityLevel(intensities[index])
                              ? AppColors.selectedColor
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: selectedAcidity ==
                                getIntensityLevel(intensities[index])
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
                      selected:
                          selectedBody == getIntensityLevel(intensities[index]),
                      onSelected: (bool selected) {
                        setState(() {
                          selectedBody = selected
                              ? getIntensityLevel(intensities[index])
                              : null;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: selectedBody ==
                                  getIntensityLevel(intensities[index])
                              ? AppColors.selectedColor
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: selectedBody ==
                                getIntensityLevel(intensities[index])
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
                      selected: selectedBitterness ==
                          getIntensityLevel(intensities[index]),
                      onSelected: (bool selected) {
                        setState(() {
                          selectedBitterness = selected
                              ? getIntensityLevel(intensities[index])
                              : null;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: selectedBitterness ==
                                  getIntensityLevel(intensities[index])
                              ? AppColors.selectedColor
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: selectedBitterness ==
                                getIntensityLevel(intensities[index])
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
                      selected: selectedSweetness ==
                          getIntensityLevel(intensities[index]),
                      onSelected: (bool selected) {
                        setState(() {
                          selectedSweetness = selected
                              ? getIntensityLevel(intensities[index])
                              : null;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: selectedSweetness ==
                                  getIntensityLevel(intensities[index])
                              ? AppColors.selectedColor
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: selectedSweetness ==
                                getIntensityLevel(intensities[index])
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
                      selected: selectedAromas.contains(aroma),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            selectedAromas.add(aroma);
                          } else {
                            selectedAromas.remove(aroma);
                          }
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: selectedAromas.contains(aroma)
                              ? AppColors.selectedColor
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: selectedAromas.contains(aroma)
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
                        final reviewText = reviewController.text.trim();
                        // if (reviewText.isEmpty) {
                        //   // 리뷰 작성 안했을 시
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //         content: Text(AppStrings.uploadReviewAlert)),
                        //   );
                        //   return;
                        // }

                        // Ideally, upload images to a server and get their URLs
                        // For demonstration, we'll use local file paths
                        final List<String> reviewImageUrls =
                            uploadedImagePaths.isNotEmpty
                                ? uploadedImagePaths
                                    .map((path) => 'file://$path')
                                    .toList()
                                : [];

                        // Create a new ReviewInfo instance
                        final newReview = ReviewInfo(
                          userName:
                              '현재 유저', // Replace with actual user data if available
                          rating: rating.toString(),
                          timestamp: DateTime.now(),
                          reviewText: reviewText,
                          reviewImageUrl: reviewImageUrls,
                          acidity: selectedAcidity,
                          body: selectedBody,
                          bitterness: selectedBitterness,
                          sweetness: selectedSweetness,
                          aroma:
                              selectedAromas.isNotEmpty ? selectedAromas : null,
                        );

                        // Add the new review to the provider
                        ref
                            .read(reviewListProvider.notifier)
                            .addReview(newReview);

                        // Optionally, show a success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(AppStrings.submitReviewAlert)),
                        );

                        // Navigate back or reset the form
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
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
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
