import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../desginsystem/strings.dart';
import 'package:cano/data/model/menu/menu_info.dart';

part 'menu_detail_api.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class MenuDetailApi {
  factory MenuDetailApi(Dio dio, {String baseUrl}) = _MenuDetailApi;

  @GET("/api/menus/{id}")
  Future<MenuInfo> getMenu(@Path("id") int id);
}
