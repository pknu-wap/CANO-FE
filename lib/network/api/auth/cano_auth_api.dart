import 'package:cano/network/model/auth/login_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'cano_auth_api.g.dart';

@RestApi(baseUrl: 'http://3.34.234.63:8080/')
abstract class CanoAuthApi {
  factory CanoAuthApi(Dio dio, {String baseUrl}) = _CanoAuthApi;

  @POST("api/auth/login/kakao")
  Future<LoginResponse> loginWithKakao(@Body() Map<String, String> token);

  @POST("api/auth/reissue")
  Future<LoginResponse> reissueAccessToken(
      @Body() Map<String, String> refreshToken);
}
