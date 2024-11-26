import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../desginsystem/strings.dart';
import 'package:cano/data/model/review/review_info.dart';

part 'review_api.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class ReviewApi {
  factory ReviewApi(Dio dio, {String baseUrl}) = _ReviewApi;

  @GET("/api/menus/{menu_id}/reviews")
  Future<List<ReviewInfo>> getReview(@Path("menu_id") int id);
}
