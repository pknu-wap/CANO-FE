// review_viewmodel.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cano/data/model/review/review_info.dart';
import 'package:image_picker/image_picker.dart';

class ReviewState {
  final List<ReviewInfo> reviews;
  final double rating;
  final String reviewText;
  final TextEditingController reviewController;
  final List<String> uploadedImagePaths;
  final IntensityLevel? selectedAcidity;
  final IntensityLevel? selectedBody;
  final IntensityLevel? selectedBitterness;
  final IntensityLevel? selectedSweetness;
  final List<Aroma> selectedAromas;

  ReviewState({
    required this.reviews,
    required this.rating,
    required this.reviewText,
    required this.reviewController,
    required this.uploadedImagePaths,
    required this.selectedAcidity,
    required this.selectedBody,
    required this.selectedBitterness,
    required this.selectedSweetness,
    required this.selectedAromas,
  });

  ReviewState copyWith({
    List<ReviewInfo>? reviews,
    double? rating,
    String? reviewText,
    TextEditingController? reviewController,
    List<String>? uploadedImagePaths,
    IntensityLevel? selectedAcidity,
    IntensityLevel? selectedBody,
    IntensityLevel? selectedBitterness,
    IntensityLevel? selectedSweetness,
    List<Aroma>? selectedAromas,
  }) {
    return ReviewState(
      reviews: reviews ?? this.reviews,
      rating: rating ?? this.rating,
      reviewText: reviewText ?? this.reviewText,
      reviewController: reviewController ?? this.reviewController,
      uploadedImagePaths: uploadedImagePaths ?? this.uploadedImagePaths,
      selectedAcidity: selectedAcidity ?? this.selectedAcidity,
      selectedBody: selectedBody ?? this.selectedBody,
      selectedBitterness: selectedBitterness ?? this.selectedBitterness,
      selectedSweetness: selectedSweetness ?? this.selectedSweetness,
      selectedAromas: selectedAromas ?? this.selectedAromas,
    );
  }
}

class ReviewViewModel extends StateNotifier<ReviewState> {
  ReviewViewModel()
      : super(
          ReviewState(
            reviewText: '',
            reviews: [
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
                aroma: [Aroma.woody],
              ),
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
                aroma: [Aroma.mild],
              ),
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
                aroma: [Aroma.nutty],
              ),
            ],
            rating: 0.0,
            reviewController: TextEditingController(),
            uploadedImagePaths: [],
            selectedAcidity: null,
            selectedBody: null,
            selectedBitterness: null,
            selectedSweetness: null,
            selectedAromas: [],
          ),
        );

  // 별점 설정
  void setRating(double newRating) {
    state = state.copyWith(rating: newRating);
  }

  // 이미지 추가
  Future<void> addImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final updatedPaths = List<String>.from(state.uploadedImagePaths)
        ..add(pickedFile.path);
      state = state.copyWith(uploadedImagePaths: updatedPaths);
    }
  }

  // 이미지 제거
  void removeImage(int index) {
    final updatedPaths = List<String>.from(state.uploadedImagePaths)
      ..removeAt(index);
    state = state.copyWith(uploadedImagePaths: updatedPaths);
  }

  // 텍스트 변경 시 상태 업데이트
  void setReviewText(String text) {
    state = state.copyWith(reviewText: text);
  }

  // Acidity 설정
  void setSelectedAcidity(IntensityLevel? level) {
    state = state.copyWith(selectedAcidity: level);
  }

  // Body 설정
  void setSelectedBody(IntensityLevel? level) {
    state = state.copyWith(selectedBody: level);
  }

  // Bitterness 설정
  void setSelectedBitterness(IntensityLevel? level) {
    state = state.copyWith(selectedBitterness: level);
  }

  // Sweetness 설정
  void setSelectedSweetness(IntensityLevel? level) {
    state = state.copyWith(selectedSweetness: level);
  }

  // Aroma 추가/제거
  void toggleAroma(Aroma aroma) {
    final updatedAromas = List<Aroma>.from(state.selectedAromas);
    if (updatedAromas.contains(aroma)) {
      updatedAromas.remove(aroma);
    } else {
      updatedAromas.add(aroma);
    }
    state = state.copyWith(selectedAromas: updatedAromas);
  }

  // 리뷰 추가
  void addReview(ReviewInfo newReview) {
    final updatedReviews = [...state.reviews, newReview];
    state = state.copyWith(reviews: updatedReviews);
  }

  // 리뷰 제출
  void submitReview() {
    final reviewText = state.reviewController.text.trim();
    final List<String> reviewImageUrls = state.uploadedImagePaths.isNotEmpty
        ? state.uploadedImagePaths.map((path) => 'file://$path').toList()
        : [];

    final newReview = ReviewInfo(
      userName: '현재 유저',
      rating: state.rating.toString(),
      timestamp: DateTime.now(),
      reviewText: reviewText,
      reviewImageUrl: reviewImageUrls,
      acidity: state.selectedAcidity,
      body: state.selectedBody,
      bitterness: state.selectedBitterness,
      sweetness: state.selectedSweetness,
      aroma: state.selectedAromas.isNotEmpty ? state.selectedAromas : null,
    );

    addReview(newReview);

    // 상태 초기화
    state = ReviewState(
      reviewText: '',
      reviews: [],
      rating: 0.0,
      reviewController: TextEditingController(),
      uploadedImagePaths: [],
      selectedAcidity: null,
      selectedBody: null,
      selectedBitterness: null,
      selectedSweetness: null,
      selectedAromas: [],
    );
  }
}

// Provider 정의
final reviewViewModelProvider =
    StateNotifierProvider.autoDispose<ReviewViewModel, ReviewState>(
  (ref) => ReviewViewModel(),
);
