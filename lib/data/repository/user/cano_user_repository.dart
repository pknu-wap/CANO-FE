import 'package:cano/network/api/user/cano_user_api.dart';
import 'package:dio/dio.dart';

import '../../../network/auth_interceptor.dart';

class CanoUserRepository {
  static final CanoUserRepository _instance = CanoUserRepository._internal();

  CanoUserRepository._internal();

  factory CanoUserRepository() {
    return _instance;
  }

  static final dio = Dio();
  // static final userApi = CanoUserApi(dio);

  Future<void> getUserInfo() async {
    dio.interceptors.add(AuthInterceptor());
    final userApi = CanoUserApi(dio);
    final userResponse = await userApi.getUserInfo();
    print("카카오 유저 response : $userResponse");
  }
}
