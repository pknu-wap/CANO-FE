import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../desginsystem/strings.dart';

part 'register_menu_api.g.dart';

// 현재 retrofit으로 Formdata 전송하는 방법이 구현되지 않아서 이 파일은 사용하지 않고 있음
@RestApi(baseUrl: AppStrings.baseUrl)
abstract class RegisterMenuApi {
  factory RegisterMenuApi(Dio dio, {String baseUrl}) = _RegisterMenuApi;

  @POST("/api/menus")
  Future<String> registerMenu(@Body() Map<String, dynamic> registerMenuRequest);
}
