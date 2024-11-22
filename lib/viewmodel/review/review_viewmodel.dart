// review_viewmodel.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cano/data/model/review/review_info.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ReviewViewmodel extends StateNotifier<List<ReviewInfo>> {
  ReviewViewmodel()
      : super([
          ReviewInfo(
              userName: "유저1",
              rating: "5",
              timestamp: DateTime(2024, 11, 16),
              reviewText: "커피가 정말 맛있어요!",
              reviewImageUrl: ["https://picsum.photos/200"],
              acidity: IntensityLevel.normal,
              body: IntensityLevel.normal,
              bitterness: IntensityLevel.strong,
              sweetness: IntensityLevel.normal,
              aroma: [Aroma.woody]),
          ReviewInfo(
              userName: "유저2",
              rating: "4",
              timestamp: DateTime(2024, 11, 15),
              reviewText: "좋은 커피지만 가격이 조금 비싸요.",
              reviewImageUrl: ["https://picsum.photos/201"],
              acidity: IntensityLevel.strong,
              body: IntensityLevel.normal,
              bitterness: IntensityLevel.normal,
              sweetness: IntensityLevel.normal,
              aroma: [Aroma.mild]),
          ReviewInfo(
              userName: "유저3",
              rating: "5",
              timestamp: DateTime(2024, 11, 14),
              reviewText: "최고!",
              reviewImageUrl: [
                "https://picsum.photos/202",
                "https://picsum.photos/203"
              ],
              acidity: IntensityLevel.normal,
              body: IntensityLevel.normal,
              bitterness: IntensityLevel.normal,
              sweetness: IntensityLevel.strong,
              aroma: [Aroma.nutty]),
        ]);

  double rating = 0.0;
  TextEditingController reviewController = TextEditingController();
  List<String> uploadedImagePaths = [];
  IntensityLevel? selectedAcidity;
  IntensityLevel? selectedBody;
  IntensityLevel? selectedBitterness;
  IntensityLevel? selectedSweetness;
  List<Aroma> selectedAromas = [];
  final ImagePicker picker = ImagePicker();

  IntensityLevel? getIntensityLevel(String description) {
    return IntensityLevel.values.firstWhere(
      (level) => level.description == description,
      orElse: () => IntensityLevel.none,
    );
  }

  void setRating(double newRating) {
    rating = newRating;
    // 필요한 경우 상태 업데이트 로직 추가
  }

  // getRating 메서드 추가 (필요한 경우)
  double getRating() {
    return rating;
  }

  // 이미지 추가
  Future<void> addImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      uploadedImagePaths.add(pickedFile.path);
      // 상태 업데이트
    }
  }

  // 이미지 제거
  void removeImage(int index) {
    uploadedImagePaths.removeAt(index);
    // 상태 업데이트
  }

  // 리뷰 추가
  void submitReview() {
    final reviewText = reviewController.text.trim();
    final List<String> reviewImageUrls = uploadedImagePaths.isNotEmpty
        ? uploadedImagePaths.map((path) => 'file://$path').toList()
        : [];

    final newReview = ReviewInfo(
      userName: '현재 유저',
      rating: rating.toString(),
      timestamp: DateTime.now(),
      reviewText: reviewText,
      reviewImageUrl: reviewImageUrls,
      acidity: selectedAcidity,
      body: selectedBody,
      bitterness: selectedBitterness,
      sweetness: selectedSweetness,
      aroma: selectedAromas.isNotEmpty ? selectedAromas : null,
    );

    addReview(newReview);
  }

  // 리뷰 추가
  void addReview(ReviewInfo newReview) {
    state = [...state, newReview];
  }

  // 리뷰 업데이트
  void updateReview(int index, ReviewInfo updatedReview) {
    final updatedList = [...state];
    if (index >= 0 && index < updatedList.length) {
      updatedList[index] = updatedReview;
      state = updatedList;
    }
  }

  // 리뷰 삭제
  void deleteReview(int index) {
    final updatedList = [...state];
    if (index >= 0 && index < updatedList.length) {
      updatedList.removeAt(index);
      state = updatedList;
    }
  }
}

final reviewViewModelProvider =
    StateNotifierProvider.autoDispose<ReviewViewmodel, List<ReviewInfo>>(
  (ref) => ReviewViewmodel(),
);
