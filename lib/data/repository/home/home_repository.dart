import 'package:cano/network/api/home/home_api.dart';
import 'package:cano/network/model/search/search_response.dart';
import 'package:dio/dio.dart';

import '../../../network/auth_interceptor.dart';

class HomeRepository {
  static final HomeRepository _instance = HomeRepository._internal();

  HomeRepository._internal();

  factory HomeRepository() {
    return _instance;
  }

  static final dio = Dio();
  static final homeApi = HomeApi(dio);

  Future<List<SearchResponse>> getHomeMenusWithType(
      String type, String degree) async {
    try {
      dio.interceptors.add(AuthInterceptor());
      return await homeApi.getHomeMenusWithType(type, degree);
    } catch (e) {
      print("메뉴 검색 $type $degree 실패 : $e");
      return [];
    }
  }

  // Future<List<HomeMenu>> getHomeMenusWithAroma(String aromas) async {
  //   return await homeApi.getHomeMenusWithAroma(aromas);
  // }
}
