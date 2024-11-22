import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/user/cano_user_response.dart';

part 'cano_user_api.g.dart';

@RestApi(baseUrl: 'http://3.34.234.63:8080/')
abstract class CanoUserApi {
  factory CanoUserApi(Dio dio, {String baseUrl}) = _CanoUserApi;

  @GET("api/members/me")
  Future<CanoUserResponse> getUserInfo();
}
