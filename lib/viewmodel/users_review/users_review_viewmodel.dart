import 'package:cano/data/model/users_review/users_review_info.dart';
import 'package:cano/data/repository/users_review/users_review_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersReviewState {
  final List<UsersReviewInfo> reviews;
  final bool isLoading;

  UsersReviewState({
    required this.reviews,
    this.isLoading = false,
  });

  UsersReviewState copyWith({
    List<UsersReviewInfo>? reviews,
    bool? isLoading,
  }) {
    return UsersReviewState(
      reviews: reviews ?? this.reviews,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class UsersReviewViewmodel extends StateNotifier<UsersReviewState> {
  UsersReviewViewmodel._internal(super.state);

  static final UsersReviewViewmodel _instance =
      UsersReviewViewmodel._internal(UsersReviewState(
    reviews: [],
    isLoading: true,
  ));

  factory UsersReviewViewmodel() {
    return _instance;
  }

  static final UsersReviewRepository usersReviewRepository =
      UsersReviewRepository();

  Future<void> fetchReviews(int id) async {
    final reviews = await usersReviewRepository.getReview(id);
    if (reviews != null) {
      state = state.copyWith(reviews: reviews);
    }
    state = state.copyWith(isLoading: false);
  }

  Future<bool> deleteMenu(int id) async {
    final isSuccess = await usersReviewRepository.deleteMenu(id);
    return isSuccess;
  }
}

final usersReviewViewModelProvider =
    StateNotifierProvider<UsersReviewViewmodel, UsersReviewState>(
  (ref) => UsersReviewViewmodel(),
);
