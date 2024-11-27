import 'package:cano/data/model/menu/menu_info.dart';
import 'package:cano/network/api/menu/menu_detail_api.dart';
import 'package:cano/network/auth_interceptor.dart';
import 'package:dio/dio.dart';

class MenuRepository {
  static final MenuRepository _instance = MenuRepository._internal();

  MenuRepository._internal();

  factory MenuRepository() {
    return _instance;
  }

  static final dio = Dio();
  static final menuDetailApi = MenuDetailApi(dio);

  Future<MenuInfo?> getMenu(int id) async {
    try {
      dio.interceptors.add(AuthInterceptor());
      final menuInfo = await menuDetailApi.getMenu(id);
      print("메뉴 조회 성공 $menuInfo");
      return menuInfo;
    } catch (e) {
      print('메뉴 조회 실패: $e');
      return null;
    }
  }
}
