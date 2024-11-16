// review_viewmodel.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cano/data/model/review/review_info.dart';

class ReviewViewmodel extends StateNotifier<List<ReviewInfo>> {
  ReviewViewmodel()
      : super([
          ReviewInfo(
            userName: "유저1",
            rating: "5",
            timestamp: DateTime(2024, 11, 16),
            reviewText: "커피가 정말 맛있어요!",
            reviewImageUrl: ["https://picsum.photos/200"],
          ),
          ReviewInfo(
            userName: "유저2",
            rating: "4",
            timestamp: DateTime(2024, 11, 15),
            reviewText: "좋은 커피지만 가격이 조금 비싸요.",
            reviewImageUrl: ["https://picsum.photos/201"],
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
          ),
        ]);

  // 리뷰 추가 메서드
  void addReview(ReviewInfo newReview) {
    state = [...state, newReview];
  }

  // 리뷰 업데이트 메서드
  void updateReview(int index, ReviewInfo updatedReview) {
    final updatedList = [...state];
    if (index >= 0 && index < updatedList.length) {
      updatedList[index] = updatedReview;
      state = updatedList;
    }
  }

  // 리뷰 삭제 메서드
  void deleteReview(int index) {
    final updatedList = [...state];
    if (index >= 0 && index < updatedList.length) {
      updatedList.removeAt(index);
      state = updatedList;
    }
  }
}

// Provider 정의
final reviewListProvider =
    StateNotifierProvider.autoDispose<ReviewViewmodel, List<ReviewInfo>>(
  (ref) => ReviewViewmodel(),
);
