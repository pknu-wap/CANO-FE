import 'package:cano/data/model/users_review/users_review_info.dart';
import 'package:cano/network/api/users_review/users_review_api.dart';
import 'package:cano/network/auth_interceptor.dart';
import 'package:dio/dio.dart';

class UsersReviewRepository {
  static final UsersReviewRepository _instance =
      UsersReviewRepository._internal();

  UsersReviewRepository._internal();

  factory UsersReviewRepository() {
    return _instance;
  }

  static final dio = Dio();
  static final usersReviewApi = UsersReviewApi(dio);

  Future<List<UsersReviewInfo>?> getReview(int id) async {
    try {
      dio.interceptors.add(AuthInterceptor());
      final usersReviewInfo = await usersReviewApi.getReview(id);
      print("리뷰 조회 성공 $usersReviewInfo");
      return usersReviewInfo;
    } catch (e) {
      print('리뷰 조회 실패: $e');
      return null;
    }
  }

  Future<bool> deleteMenu(int id) async {
    dio.interceptors.add(AuthInterceptor());
    try {
      await usersReviewApi.deleteMenu(id);
      print("리뷰 삭제 성공 ${id}");
      return true;
    } catch (e) {
      print("리뷰 삭제 실패 : $e");
      return false;
    }
  }
}
