import 'package:cano/data/model/users_review/users_review_info.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../desginsystem/strings.dart';
import 'package:cano/data/model/submit_review/review_info.dart';

part 'users_review_api.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class UsersReviewApi {
  factory UsersReviewApi(Dio dio, {String baseUrl}) = _UsersReviewApi;

  @GET("/api/menus/{menu_id}/reviews")
  
  Future<List<UsersReviewInfo>?> getReview(@Path("menu_id") int id);
}
