import 'package:cano/viewmodel/auth/cano_token_manager.dart';
import 'package:dio/dio.dart';

import '../../../desginsystem/strings.dart';
import '../../../network/auth_interceptor.dart';

class RegisterMenuRepository {
  static final RegisterMenuRepository _instance =
      RegisterMenuRepository._internal();

  RegisterMenuRepository._internal();

  factory RegisterMenuRepository() {
    return _instance;
  }

  // static final registerMenuApi = RegisterMenuApi(Dio());
  static final dio = Dio();

  Future<bool> registerMenu(FormData formData) async {
    dio.interceptors.add(AuthInterceptor());
    try {
      print("CANO 메뉴 토큰 : ${await CanoTokenManager().getAccessToken()}");
      final result = await dio.post(apiUrl.registerMenu, data: formData);
      print("메뉴 등록 성공 $result");
      return true;
    } catch (e) {
      print("메뉴 등록 실패 : $e");
      return false;
    }
  }
}
