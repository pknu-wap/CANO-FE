import 'package:cano/data/repository/search/search_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/menu/menu_info.dart';

class SearchState {
  final List<MenuInfo> menuInfoList;
  final List<String> keywordList;
  final bool isSearched;

  SearchState({
    required this.menuInfoList,
    required this.keywordList,
    required this.isSearched,
  });

  SearchState copyWith({
    List<MenuInfo>? menuInfoList,
    List<String>? keywordList,
    bool? isSearched,
    String? tabText,
  }) {
    return SearchState(
      menuInfoList: menuInfoList ?? this.menuInfoList,
      keywordList: keywordList ?? this.keywordList,
      isSearched: isSearched ?? this.isSearched,
    );
  }
}

class SearchViewmodel extends StateNotifier<SearchState> {
  // 내부 생성자
  SearchViewmodel._internal(super.state);

  static final SearchViewmodel _instance =
      SearchViewmodel._internal(SearchState(
          menuInfoList: [
            MenuInfo(
                name: '컴포즈 커피 돌체 라떼',
                price: 5900,
                score: 3.5,
                scoreCount: 300,
                isLike: true,
                menuImageUrl: '',
                acidity: 0.38,
                aromas: ["아몬드", "곡물"],
                body: 0.72,
                bitterness: 0.4,
                sweetness: 0.88,
                id: 1),
            MenuInfo(
                name: '컴포즈 커피 돌체 라떼',
                price: 5900,
                score: 3.5,
                scoreCount: 300,
                isLike: true,
                menuImageUrl: '',
                acidity: 0.38,
                aromas: ["아몬드", "곡물"],
                body: 0.72,
                bitterness: 0.4,
                sweetness: 0.88,
                id: 1),
            MenuInfo(
                name: '컴포즈 커피 돌체 라떼',
                price: 5900,
                score: 3.5,
                scoreCount: 300,
                isLike: true,
                menuImageUrl: '',
                acidity: 0.38,
                aromas: ["아몬드", "곡물"],
                body: 0.72,
                bitterness: 0.4,
                sweetness: 0.88,
                id: 1),
            MenuInfo(
                name: '컴포즈 커피 돌체 라떼',
                price: 5900,
                score: 3.5,
                scoreCount: 300,
                isLike: true,
                menuImageUrl: '',
                acidity: 0.38,
                aromas: ["아몬드", "곡물"],
                body: 0.72,
                bitterness: 0.4,
                sweetness: 0.88,
                id: 1),
            MenuInfo(
                name: '컴포즈 커피 돌체 라떼',
                price: 5900,
                score: 3.5,
                scoreCount: 300,
                isLike: true,
                menuImageUrl: '',
                acidity: 0.38,
                aromas: ["아몬드", "곡물"],
                body: 0.72,
                bitterness: 0.4,
                sweetness: 0.88,
                id: 1),
            MenuInfo(
                name: '컴포즈 커피 돌체 라떼',
                price: 5900,
                score: 3.5,
                scoreCount: 300,
                isLike: true,
                menuImageUrl: '',
                acidity: 0.38,
                aromas: ["아몬드", "곡물"],
                body: 0.72,
                bitterness: 0.4,
                sweetness: 0.88,
                id: 1),
          ],
          isSearched: false,
          keywordList: []));

  factory SearchViewmodel() {
    return _instance;
  }

  static final SearchRepository searchRepository = SearchRepository();

  Future<void> searchWithKeyword(String query) async {
    final menus = await searchRepository.searchWithKeyword(query);
    setMenuInfoList(menus);
  }

  void setMenuInfoList(List<MenuInfo> menus) {
    state = state.copyWith(menuInfoList: menus);
  }

  void setIsSearched() {
    state = state.copyWith(isSearched: true);
  }

  Future<void> setKeywordList() async {
    List<String> keywordList = await searchRepository.getKeywordList();
    state = state.copyWith(keywordList: keywordList);
  }

  Future<void> saveKeyword(String keyword) async {
    searchRepository.saveKeyword(keyword);
    setKeywordList();
  }

  Future<void> removeKeyword(String keyword) async {
    searchRepository.removeKeyword(keyword);
    setKeywordList();
  }
}

final searchProvider =
    StateNotifierProvider.autoDispose<SearchViewmodel, SearchState>(
  (ref) => SearchViewmodel(),
);
