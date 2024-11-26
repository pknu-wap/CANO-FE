import 'package:cano/data/model/review/review_info.dart';
import 'package:cano/network/api/review/review_api.dart';
import 'package:cano/network/auth_interceptor.dart';
import 'package:dio/dio.dart';

class ReviewRepository {
  static final ReviewRepository _instance = ReviewRepository._internal();

  ReviewRepository._internal();

  factory ReviewRepository() {
    return _instance;
  }

  static final dio = Dio();
  static final reviewApi = ReviewApi(dio);

  Future<List<ReviewInfo>?> getReview(int id) async {
    try {
      dio.interceptors.add(AuthInterceptor());
      final reviewInfo = await reviewApi.getReview(id);
      print("리뷰 조회 성공 ${reviewInfo}");
      return reviewInfo;
    } catch (e) {
      print('리뷰 조회 실패: $e');
      return null;
    }
  }


}
