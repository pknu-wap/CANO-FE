import 'package:cano/data/repository/search_repository.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/cafe_info.dart';
import '../../data/model/menu/menu_info.dart';

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
            const CafeInfo(
                cafeName: '스타벅스 경성대점',
                rating: 5.0,
                isLike: true,
                likeCount: 200,
                ratingCount: 59,
                cafeImageUrl: ''),
          ],
          menuInfoList: [
            const MenuInfo(
              cafeName: "스타벅스",
              menuName: "스타벅스 돌체 라떼",
              menuInfoText: "",
              price: 5900,
              rating: 4.88,
              ratingCount: 201,
              isLike: false,
              likeCount: 0,
              menuImageUrl: "",
              ratingCountsByStar: {
                5: 180,
                4: 11,
                3: 10,
                2: 0,
                1: 0,
              },
              flavorCounts: {
                '산미': 0.38,
                '바디감': 0.72,
                '쓴맛': 0.0,
                '달달함': 0.88,
              },
              aroma: [
                '우디향',
                '마일드',
                '견과류향',
                '곡물향',
                '구운 곡물향',
                '아몬드향',
                '코코아향',
                '스파이스향',
                '캐러멜향'
              ],
              aromaCounts: {
                "우디향": 0,
                "마일드": 0,
                "견과류향": 0,
                "곡물향": 0,
                "구운 곡물향": 0,
                "아몬드향": 17,
                "코코아향": 8,
                "스파이시향": 0,
                "캐러멜향": 0,
              },
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
