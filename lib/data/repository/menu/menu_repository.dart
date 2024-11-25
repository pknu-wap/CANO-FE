import 'package:cano/data/model/menu/menu_info.dart';
import 'package:cano/network/api/menu/menu_detail_api.dart';
import 'package:dio/dio.dart';

class MenuRepository {
  static final MenuRepository _instance = MenuRepository._internal();

  MenuRepository._internal();

  factory MenuRepository() {
    return _instance;
  }

  static final menuDetailApi = MenuDetailApi(Dio());

  Future<MenuInfo?> getMenu(int id) async {
    try {
      final menuInfo = await menuDetailApi.getMenu(id);
      return menuInfo;
    } catch (e) {
      print('Error fetching menu: $e');
      return null;
    }
  }
}
