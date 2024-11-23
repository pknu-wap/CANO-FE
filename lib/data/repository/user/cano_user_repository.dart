import 'package:cano/desginsystem/strings.dart';
import 'package:cano/network/api/user/cano_user_api.dart';
import 'package:cano/network/model/user/cano_user_response.dart';
import 'package:dio/dio.dart';

import '../../../network/auth_interceptor.dart';

class CanoUserRepository {
  static final CanoUserRepository _instance = CanoUserRepository._internal();

  CanoUserRepository._internal();

  factory CanoUserRepository() {
    return _instance;
  }

  static final dio = Dio();
  static final userApi = CanoUserApi(dio);

  Future<CanoUserResponse> getUserInfo() async {
    dio.interceptors.add(AuthInterceptor());
    final userResponse = await userApi.getUserInfo();
    print("카카오 유저 response : $userResponse");
    return userResponse;
  }

  Future<void> modifiyUserInfo(FormData formdata) async {
    dio.interceptors.add(AuthInterceptor());
    try {
      final result = await dio.put(apiUrl.modifiyUserInfo, data: formdata);
      print("회원 정보 변경 성공 $result");
    } catch (e) {
      print("회원 정보 변경 실패 : $e");
    }
  }
}
