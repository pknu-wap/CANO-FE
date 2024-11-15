import 'package:cano/data/model/user_info/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class UserInfoViewmodel extends StateNotifier<UserInfo> {
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

  Future<void> pickImageFromGallery(
      BuildContext context, void onSuccess(String)) async {
    final ImagePicker _picker = ImagePicker();

    // 갤러리에서 이미지 선택
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // 선택된 이미지의 경로
      String imagePath = image.path;
      onSuccess(imagePath);
    }
  }
}

final userInfoProvider =
    StateNotifierProvider.autoDispose<UserInfoViewmodel, UserInfo>(
  (ref) => UserInfoViewmodel(),
);
