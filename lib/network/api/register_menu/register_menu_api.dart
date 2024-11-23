import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../desginsystem/strings.dart';

part 'register_menu_api.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class RegisterMenuApi {
  factory RegisterMenuApi(Dio dio, {String baseUrl}) = _RegisterMenuApi;

  @POST("/api/menus")
  Future<String> registerMenu(@Body() Map<String, dynamic> registerMenuRequest);
}
