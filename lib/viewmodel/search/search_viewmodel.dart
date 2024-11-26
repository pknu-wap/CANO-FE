import 'package:cano/data/repository/search/search_repository.dart';
import 'package:cano/data/repository/user/cano_user_repository.dart';
import 'package:cano/network/model/search/search_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchState {
  final List<SearchResponse> menuInfoList;
  final List<String> keywordList;
  final bool isSearched;
  final String userName;

  SearchState({
    required this.userName,
    required this.menuInfoList,
    required this.keywordList,
    required this.isSearched,
  });

  SearchState copyWith(
      {List<SearchResponse>? menuInfoList,
      List<String>? keywordList,
      bool? isSearched,
      String? userName}) {
    return SearchState(
      userName: userName ?? this.userName,
      menuInfoList: menuInfoList ?? this.menuInfoList,
      keywordList: keywordList ?? this.keywordList,
      isSearched: isSearched ?? this.isSearched,
    );
  }
}

class SearchViewmodel extends StateNotifier<SearchState> {
  // 내부 생성자
  SearchViewmodel._internal(super.state);

  static final SearchViewmodel _instance = SearchViewmodel._internal(
      SearchState(
          menuInfoList: [], isSearched: false, keywordList: [], userName: ""));

  factory SearchViewmodel() {
    return _instance;
  }

  static final SearchRepository searchRepository = SearchRepository();
  static final CanoUserRepository userRepository = CanoUserRepository();

  Future<void> setUserName() async {
    state = state.copyWith(userName: await userRepository.getUserName());
  }

  Future<void> searchWithKeyword(String keyword) async {
    try {
      setMenuInfoList([]);
      final searchResponses = await searchRepository.searchWithKeyword(keyword);
      print("검색 성공 : $searchResponses");
      searchResponses.forEach((menu) => _addMenutoMenuInfoList(menu));
    } catch (e) {
      print("검색 실패 : $e");
    }
  }

  void _addMenutoMenuInfoList(SearchResponse menu) {
    state = state.copyWith(
      menuInfoList: [...state.menuInfoList, menu],
    );
  }

  void setMenuInfoList(List<SearchResponse> menus) {
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

final searchProvider = StateNotifierProvider<SearchViewmodel, SearchState>(
  (ref) => SearchViewmodel(),
);
