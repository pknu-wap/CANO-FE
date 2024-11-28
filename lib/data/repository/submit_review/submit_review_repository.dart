import 'package:cano/data/model/submit_review/review_info.dart';
import 'package:cano/network/api/submit_review/submit_review_api.dart';
import 'package:dio/dio.dart';

class SubmitReviewRepository {
  static final SubmitReviewRepository _instance =
      SubmitReviewRepository._internal();

  SubmitReviewRepository._internal();

  factory SubmitReviewRepository() {
    return _instance;
  }

  final Dio dio = Dio();



  static final submitReviewApi = SubmitReviewApi(Dio());

  Future<bool> submitReview(ReviewInfo reviewInfo) async {
    final message =
        await submitReviewApi.submitReview(reviewInfo.toJson());
    if (message == "success") return true;
    return false;
  }
}
