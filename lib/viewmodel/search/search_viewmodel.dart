import 'package:cano/data/repository/search_repository.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/cafe_info.dart';
import '../../data/model/menu_info.dart';

class SearchState {
  final List<CafeInfo> cafeInfoList;
  final List<MenuInfo> menuInfoList;
  final List<String> keywordList;
  final bool isSearched;
  final String tabText;

  SearchState(
      {required this.cafeInfoList,
      required this.menuInfoList,
      required this.keywordList,
      required this.isSearched,
      required this.tabText});

  SearchState copyWith({
    List<CafeInfo>? cafeInfoList,
    List<MenuInfo>? menuInfoList,
    List<String>? keywordList,
    bool? isSearched,
    String? tabText,
  }) {
    return SearchState(
      cafeInfoList: cafeInfoList ?? this.cafeInfoList,
      menuInfoList: menuInfoList ?? this.menuInfoList,
      keywordList: keywordList ?? this.keywordList,
      isSearched: isSearched ?? this.isSearched,
      tabText: tabText ?? this.tabText,
    );
  }
}

class SearchViewmodel extends StateNotifier<SearchState> {
  // 내부 생성자
  SearchViewmodel._internal(super.state);

  static final SearchViewmodel _instance =
      SearchViewmodel._internal(SearchState(
          cafeInfoList: [
            CafeInfo(
                cafeName: '스타벅스 경성대점',
                rating: 5.0,
                isLike: true,
                likeCount: 200,
                ratingCount: 59,
                cafeImageUrl: ''),
          ],
          menuInfoList: [
            MenuInfo(
              cafeName: '스타벅스',
              menuName: '아메리카노',
              menuInfoText: '맛있음',
              price: 4500,
              rating: 5.0,
              ratingCount: 300,
              isLike: true,
              likeCount: 150,
              menuImageUrl: '',
            ),
          ],
          isSearched: false,
          tabText: AppStrings.cafe,
          keywordList: []));

  factory SearchViewmodel() {
    return _instance;
  }

  final SearchRepository searchRepository = SearchRepository();

  void setIsSearched() {
    state = state.copyWith(isSearched: true);
  }

  void setTabText(String tab) {
    state = state.copyWith(tabText: tab);
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

  Future<void> getCafeInfoList() async {
    searchRepository.getCafeInfoList();
  }

  Future<void> getMenuInfoList() async {
    searchRepository.getMenuInfoList();
  }
}

final searchProvider =
    StateNotifierProvider.autoDispose<SearchViewmodel, SearchState>(
  (ref) => SearchViewmodel(),
);
