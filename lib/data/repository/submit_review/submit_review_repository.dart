import 'package:dio/dio.dart';

import '../../../desginsystem/strings.dart';
import '../../../network/auth_interceptor.dart';

class SubmitReviewRepository {
  static final SubmitReviewRepository _instance =
      SubmitReviewRepository._internal();

  SubmitReviewRepository._internal();

  factory SubmitReviewRepository() {
    return _instance;
  }

  static final dio = Dio();
  // static final submitReviewApi = SubmitReviewApi(Dio());

  Future<bool> submitReview(int menuId, FormData formData) async {
    dio.interceptors.add(AuthInterceptor());
    try {
      final result = await dio.post(
          apiUrl.writeReview.replaceAll("{menuId}", menuId.toString()),
          data: formData);
      print("리뷰 작성 성공 $result");
      return true;
    } catch (e) {
      print("리뷰 작성 실패 : $e");
      return false;
    }
  }
}
