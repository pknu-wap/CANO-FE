import 'package:cano/network/api/home/home_api.dart';
import 'package:dio/dio.dart';

import '../../model/home/home_menu.dart';

class HomeRepository {
  static final HomeRepository _instance = HomeRepository._internal();

  HomeRepository._internal();

  factory HomeRepository() {
    return _instance;
  }

  static final dio = Dio();
  static final homeApi = HomeApi(dio);

  Future<List<HomeMenu>> getHomeMenusWithType(
      String type, String degree) async {
    return await homeApi.getHomeMenusWithType(type, degree);
  }

  Future<List<HomeMenu>> getHomeMenusWithAroma(String aromas) async {
    return await homeApi.getHomeMenusWithAroma(aromas);
  }

// final dio = Dio().interceptors.add(AuthInterceptor());
}
