import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../desginsystem/strings.dart';

part 'submit_review_api.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class SubmitReviewApi {
  factory SubmitReviewApi(Dio dio, {String baseUrl}) = _SubmitReviewApi;

  @POST("/api/menus/{menu_id}/reviews")
  @MultiPart()
  Future<String> submitReview(@Body() FormData formData);
}
