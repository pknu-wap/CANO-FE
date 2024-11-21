import 'package:cano/data/model/user_info/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class UserInfoViewmodel extends StateNotifier<UserInfo> {
  UserInfoViewmodel._internal(super.state);

  static final UserInfoViewmodel _instance =
      UserInfoViewmodel._internal(UserInfo(
    name: "",
    profileImageUrl: '',
    acidity: null,
    body: null,
    bitterness: null,
    sweetness: null,
    aroma: [],
  ));

  factory UserInfoViewmodel() {
    return _instance;
  }

  void setName(String newName) {
    state = state.copyWith(name: newName);
  }
  // void setAge(int newAge) {
  //   state = state.copyWith(age: newAge);
  // }

  // void setGender(bool? newGender) {
  //   state = state.copyWith(gender: newGender);
  // }

  void setProfileImageUrl(String newUrl) {
    state = state.copyWith(profileImageUrl: newUrl);
  }

  void setAcidity(String description) {
    state = state.copyWith(acidity: Intensitylevel.fromString(description));
  }

  void setBody(String description) {
    state = state.copyWith(body: Intensitylevel.fromString(description));
  }

  void setBitterness(String description) {
    state = state.copyWith(bitterness: Intensitylevel.fromString(description));
  }

  void setSweetness(String description) {
    state = state.copyWith(sweetness: Intensitylevel.fromString(description));
  }

  void addAroma(String scent) {
    state = state.copyWith(aroma: [...state.aroma, Aroma.fromString(scent)]);
  }

  void toggleAroma(String scent) {
    final aromaToAdd = Aroma.fromString(scent);

    if (state.aroma.contains(aromaToAdd)) {
      state = state.copyWith(
        aroma: List.from(state.aroma)..remove(aromaToAdd),
      );
    } else {
      state = state.copyWith(
        aroma: [...state.aroma, aromaToAdd],
      );
    }
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
