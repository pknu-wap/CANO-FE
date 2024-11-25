import 'package:cano/network/model/search/search_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../desginsystem/strings.dart';

part 'search_api.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class SearchApi {
  factory SearchApi(Dio dio, {String baseUrl}) = _SearchApi;

  @GET("api/menus/search")
  Future<List<SearchResponse>> searchWithKeyword(
      @Query("query") String keyword);

  @GET("api/menus/search")
  Future<List<SearchResponse>> getHomeMenus(
      @Query("attribute") String attribute, @Query("degree") String degree);
}
