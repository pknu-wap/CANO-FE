class SearchRepository {
  static final SearchRepository _instance = SearchRepository._internal();

  SearchRepository._internal();

  factory SearchRepository() {
    return _instance;
  }

  Future<void> getCafeInfoList() async {}

  Future<void> getMenuInfoList() async {}
}
