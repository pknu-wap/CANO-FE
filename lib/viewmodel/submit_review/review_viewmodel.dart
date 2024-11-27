// review_viewmodel.dart
import 'package:cano/data/repository/submit_review/submit_review_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cano/data/model/submit_review/review_info.dart';
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
  final SubmitReviewRepository reviewRepository;

  ReviewViewModel({required this.reviewRepository})
      : super(
          ReviewState(
            reviews: [],
            rating: 0.0,
            reviewText: '',
            reviewController: TextEditingController(),
            uploadedImagePaths: [],
            selectedAcidity: null,
            selectedBody: null,
            selectedBitterness: null,
            selectedSweetness: null,
            selectedAromas: [],
          ),
        ) {
    fetchReview(1); // 초기 리뷰 ID 설정
  }

  /// 리뷰 목록을 가져오는 메서드
  Future<void> fetchReview(int id) async {
    try {
      final reviewInfoList = await reviewRepository.getReview(id);
      if (reviewInfoList != null) {
        state = state.copyWith(reviews: reviewInfoList);
      } else {
        // API 응답이 null일 경우 기본 리뷰 추가
        state = state.copyWith(
          reviews: [
            ReviewInfo(
              id: 0,
              memberName: "",
              contents: "",
              score: 0.0,
              imageUrls: null,
              acidity: null,
              body: null,
              bitterness: null,
              sweetness: null,
              aroma: null,
              createdAt: DateTime.now(),
            ),
          ],
          rating: 0.0,
          reviewText: '',
          reviewController: TextEditingController(),
          uploadedImagePaths: [],
          selectedAcidity: null,
          selectedBody: null,
          selectedBitterness: null,
          selectedSweetness: null,
          selectedAromas: [],
        );
      }
    } catch (e, stackTrace) {
      // 에러 처리: 로그 출력 및 상태 초기화
      print('Error fetching review: $e');
      print(stackTrace);
      state = state.copyWith(
        reviews: [],
        rating: 0.0,
        reviewText: '',
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

  /// 별점 설정 메서드
  void setRating(double newRating) {
    state = state.copyWith(rating: newRating);
  }

  /// 이미지 추가 메서드
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

  /// 이미지 제거 메서드
  void removeImage(int index) {
    final updatedPaths = List<String>.from(state.uploadedImagePaths)
      ..removeAt(index);
    state = state.copyWith(uploadedImagePaths: updatedPaths);
  }

  /// 리뷰 텍스트 변경 시 상태 업데이트
  void setReviewText(String text) {
    state = state.copyWith(reviewText: text);
  }

  /// Acidity 설정 메서드
  void setSelectedAcidity(IntensityLevel? level) {
    state = state.copyWith(selectedAcidity: level);
  }

  /// Body 설정 메서드
  void setSelectedBody(IntensityLevel? level) {
    state = state.copyWith(selectedBody: level);
  }

  /// Bitterness 설정 메서드
  void setSelectedBitterness(IntensityLevel? level) {
    state = state.copyWith(selectedBitterness: level);
  }

  /// Sweetness 설정 메서드
  void setSelectedSweetness(IntensityLevel? level) {
    state = state.copyWith(selectedSweetness: level);
  }

  /// Aroma 추가/제거 메서드
  void toggleAroma(Aroma aroma) {
    final updatedAromas = List<Aroma>.from(state.selectedAromas);
    if (updatedAromas.contains(aroma)) {
      updatedAromas.remove(aroma);
    } else {
      updatedAromas.add(aroma);
    }
    state = state.copyWith(selectedAromas: updatedAromas);
  }

  /// 리뷰 추가 메서드
  void addReview(ReviewInfo newReview) {
    final updatedReviews = [...state.reviews, newReview];
    state = state.copyWith(reviews: updatedReviews);
  }
}

// Provider 정의
final reviewViewModelProvider =
    StateNotifierProvider.autoDispose<ReviewViewModel, ReviewState>(
  (ref) => ReviewViewModel(reviewRepository: SubmitReviewRepository()),
);
