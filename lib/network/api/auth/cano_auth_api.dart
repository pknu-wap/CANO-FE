import 'package:cano/network/model/login_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'cano_auth_api.g.dart';

@RestApi(baseUrl: '/')
abstract class CanoAuthApi {
  factory CanoAuthApi(Dio dio, {String baseUrl}) = _CanoAuthApi;

  @POST("oauth2/login/kakao")
  Future<String> loginWithKakao(@Body() String token);

  @GET("api/user")
  Future<LoginResponse> getTokens(@Header("Authorization") String token);
}
