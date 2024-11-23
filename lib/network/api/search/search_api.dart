import 'package:cano/data/model/menu/menu_info.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../desginsystem/strings.dart';

part 'search_api.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class SearchApi {
  factory SearchApi(Dio dio, {String baseUrl}) = _SearchApi;

  @POST("/api/menus")
  Future<List<MenuInfo>> searchWithKeyword(@Query('query') String query);
}
