import 'package:cano/data/model/user_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoViewmodel extends StateNotifier<UserInfo> {
  UserInfoViewmodel(super.state);

  void setName(String newName) {
    state = state.copyWith(name: newName);
  }

  void setAge(int newAge) {
    state = state.copyWith(age: newAge);
  }

  void setArea(String newArea) {
    state = state.copyWith(area: newArea);
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
        (ref) => UserInfoViewmodel(UserInfo(
              name: "",
              age: 0,
              coffees: [],
              keywords: [],
              area: '',
              gender: null,
              profileImageUrl: '',
            )));
