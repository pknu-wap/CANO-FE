import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../data/model/home/home_menu.dart';
import '../../../desginsystem/strings.dart';

part 'home_api.g.dart';

@RestApi(baseUrl: AppStrings.baseurl)
abstract class HomeApi {
  factory HomeApi(Dio dio, {String baseUrl}) = _HomeApi;

  @GET("api/menus/attribute")
  Future<List<HomeMenu>> getHomeMenusWithType(
      @Query("type") String type, @Query("degree") String degree);

  @GET("/api/menus/aroma")
  Future<List<HomeMenu>> getHomeMenusWithAroma(@Query("type") String aromas);
}
