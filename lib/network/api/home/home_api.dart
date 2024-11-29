import 'package:cano/network/model/search/search_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../desginsystem/strings.dart';

part 'home_api.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class HomeApi {
  factory HomeApi(Dio dio, {String baseUrl}) = _HomeApi;

  @GET("api/menus/search")
  Future<List<SearchResponse>> getHomeMenusWithType(
      @Query("attribute") String attribute, @Query("degree") String degree);

  // @GET("/api/menus/aroma")
  // Future<List<HomeMenu>> getHomeMenusWithAroma(@Query("type") String aromas);
}
