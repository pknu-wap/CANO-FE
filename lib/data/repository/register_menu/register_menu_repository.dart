import 'package:cano/data/model/register_menu/register_menu_request.dart';
import 'package:cano/network/api/register_menu/register_menu_api.dart';
import 'package:dio/dio.dart';

class RegisterMenuRepository {
  static final RegisterMenuRepository _instance =
      RegisterMenuRepository._internal();

  RegisterMenuRepository._internal();

  factory RegisterMenuRepository() {
    return _instance;
  }

  static final registerMenuApi = RegisterMenuApi(Dio());

  Future<bool> registerMenu(RegisterMenuRequest registerMenuRequest) async {
    final message =
        await registerMenuApi.registerMenu(registerMenuRequest.toJson());
    if (message == "success") return true;
    return false;
  }
}
