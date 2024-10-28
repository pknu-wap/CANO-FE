import 'package:cano/data/model/user_info/user_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoViewmodel extends StateNotifier<UserInfo> {
  // 내부 생성자
  UserInfoViewmodel._internal(super.state);

  static final UserInfoViewmodel _instance =
      UserInfoViewmodel._internal(const UserInfo(
    name: "",
    age: 0,
    coffees: [],
    keywords: [],
    area: "",
    gender: null,
    profileImageUrl: '',
  ));

  factory UserInfoViewmodel() {
    return _instance;
  }

  void setName(String newName) {
    state = state.copyWith(name: newName);
  }

  void setAge(int newAge) {
    state = state.copyWith(age: newAge);
  }

  void setArea(String area) {
    state = state.copyWith(area: area);
  }

  void setGender(bool? newGender) {
    state = state.copyWith(gender: newGender);
  }

  void setProfileImageUrl(String newUrl) {
    state = state.copyWith(profileImageUrl: newUrl);
  }

  void addCoffee(String coffee) {
    state = state.copyWith(coffees: [...state.coffees, coffee]);
  }

  void removeCoffee(String coffee) {
    state = state.copyWith(
        coffees: state.coffees.where((c) => c != coffee).toList());
  }

  void addKeyword(String keyword) {
    state = state.copyWith(keywords: [...state.keywords, keyword]);
  }

  void removeKeyword(String keyword) {
    state = state.copyWith(
        keywords: state.keywords.where((k) => k != keyword).toList());
  }
}

final userInfoProvider =
    StateNotifierProvider.autoDispose<UserInfoViewmodel, UserInfo>(
  (ref) => UserInfoViewmodel(),
);
