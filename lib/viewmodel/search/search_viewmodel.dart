import 'package:cano/data/repository/search_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cano/data/model/menu/menu_info.dart';

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
          // cafeInfoList: [
          //   const CafeInfo(
          //       cafeName: '스타벅스 경성대점',
          //       rating: 5.0,
          //       isLike: true,
          //       likeCount: 200,
          //       ratingCount: 59,
          //       cafeImageUrl: ''),
          // ],
          menuInfoList: [
            const MenuInfo(
                cafeName: '컴포즈커피',
                menuName: '돌체라떼',
                price: 5900,
                rating: 3.5,
                ratingCount: 300,
                isLike: true,
                menuImageUrl: '',
                acidity: 0.38,
                aromas: ["아몬드", "곡물"],
                body: 0.72,
                bitterness: 0.4,
                sweetness: 0.88),
            const MenuInfo(
                cafeName: '컴포즈커피',
                menuName: '돌체라떼',
                price: 5900,
                rating: 3.5,
                ratingCount: 300,
                isLike: true,
                menuImageUrl: '',
                acidity: 0.38,
                aromas: ["아몬드", "곡물"],
                body: 0.72,
                bitterness: 0.4,
                sweetness: 0.88),
            const MenuInfo(
                cafeName: '컴포즈커피',
                menuName: '돌체라떼',
                price: 5900,
                rating: 3.5,
                ratingCount: 300,
                isLike: true,
                menuImageUrl: '',
                acidity: 0.38,
                aromas: ["아몬드", "곡물"],
                body: 0.72,
                bitterness: 0.4,
                sweetness: 0.88),
            const MenuInfo(
                cafeName: '컴포즈커피',
                menuName: '돌체라떼',
                price: 5900,
                rating: 3.5,
                ratingCount: 300,
                isLike: true,
                menuImageUrl: '',
                acidity: 0.38,
                aromas: ["아몬드", "곡물"],
                body: 0.72,
                bitterness: 0.4,
                sweetness: 0.88),
            const MenuInfo(
                cafeName: '컴포즈커피',
                menuName: '돌체라떼',
                price: 5900,
                rating: 3.5,
                ratingCount: 300,
                isLike: true,
                menuImageUrl: '',
                acidity: 0.38,
                aromas: ["아몬드", "곡물"],
                body: 0.72,
                bitterness: 0.4,
                sweetness: 0.88),
            const MenuInfo(
                cafeName: '컴포즈커피',
                menuName: '돌체라떼',
                price: 5900,
                rating: 3.5,
                ratingCount: 300,
                isLike: true,
                menuImageUrl: '',
                acidity: 0.38,
                aromas: ["아몬드", "곡물"],
                body: 0.72,
                bitterness: 0.4,
                sweetness: 0.88),
          ],
          isSearched: false,
          keywordList: []));

  factory SearchViewmodel() {
    return _instance;
  }

  final SearchRepository searchRepository = SearchRepository();

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

  Future<void> getMenuInfoList() async {
    searchRepository.getMenuInfoList();
  }
}

final searchProvider =
    StateNotifierProvider.autoDispose<SearchViewmodel, SearchState>(
  (ref) => SearchViewmodel(),
);
