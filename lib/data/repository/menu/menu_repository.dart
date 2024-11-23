import 'package:shared_preferences/shared_preferences.dart';

class MenuRepository {
  static final MenuRepository _instance = MenuRepository._internal();

  MenuRepository._internal();

  factory MenuRepository() {
    return _instance;
  }
  
  Future<void> getMenuName() async {}

  Future<void> getReview() async {}

  Future<void> getLikes() async {}

  Future<void> getRatings() async {}

  Future<void> getFlavorAttribute() async {}
}
