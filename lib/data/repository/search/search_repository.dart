import 'package:cano/data/model/menu_info.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../network/api/search/search_api.dart';

const String recentKeywordKey = "recent_keyword";

class SearchRepository {
  static final SearchRepository _instance = SearchRepository._internal();

  SearchRepository._internal();

  factory SearchRepository() {
    return _instance;
  }

  static final searchApi = SearchApi(Dio());

  Future<List<MenuInfo>> searchWithKeyword(String query) async {
    return await searchApi.searchWithKeyword(query);
  }

  // 검색어 관련 로직
  Future<List<String>> getKeywordList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(recentKeywordKey) ?? []; // 저장된 값이 없으면 빈 리스트 반환
  }

  Future<void> saveKeyword(String keyword) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var keywordList = prefs.getStringList(recentKeywordKey) ?? [];

    // 중복 키워드 확인 후 제거
    if (keywordList.contains(keyword)) {
      keywordList.remove(keyword);
    }
    keywordList.insert(0, keyword);

    await prefs.setStringList(recentKeywordKey, keywordList);
  }

  Future<void> removeKeyword(String keyword) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var keywordList = prefs.getStringList(recentKeywordKey);
    keywordList!.remove(keyword);
    await prefs.setStringList(recentKeywordKey, keywordList);
  }
}
