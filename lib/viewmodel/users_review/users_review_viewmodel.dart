import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cano/data/model/users_review/users_review_info.dart';
import 'package:cano/data/repository/users_review/users_review_repository.dart';

class UsersReviewState {
  final List<UsersReviewInfo> reviews;
  final bool isLoading;
  final String? error;

  UsersReviewState({
    required this.reviews,
    this.isLoading = false,
    this.error,
  });

  UsersReviewState copyWith({
    List<UsersReviewInfo>? reviews,
    bool? isLoading,
    String? error,
  }) {
    return UsersReviewState(
      reviews: reviews ?? this.reviews,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class UsersReviewViewmodel extends StateNotifier<UsersReviewState> {
  final UsersReviewRepository usersReviewRepository;

  UsersReviewViewmodel({required this.usersReviewRepository})
      : super(
          UsersReviewState(
            reviews: [],
            isLoading: false,
            error: null,
          ),
        ) {
    fetchReviews(1); // 초기 리뷰 ID 설정 (필요에 따라 변경)
  }

  /// 리뷰 목록을 가져오는 메서드
  Future<void> fetchReviews(int id) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final reviews = await usersReviewRepository.getReview(id);
      if (reviews != null) {
        state = state.copyWith(reviews: reviews, isLoading: false);
      } else {
        // API 응답이 null일 경우 빈 리스트로 설정
        state = state.copyWith(reviews: [], isLoading: false);
      }
    } catch (e, stackTrace) {
      // 에러 처리: 로그 출력 및 상태 업데이트
      print('Error fetching reviews: $e');
      if (kDebugMode) {
        print(stackTrace);
      }
      state = state.copyWith(
        reviews: [],
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}


final usersReviewViewModelProvider =
    StateNotifierProvider.autoDispose<UsersReviewViewmodel, UsersReviewState>(
  (ref) => UsersReviewViewmodel(usersReviewRepository: UsersReviewRepository()),
);
