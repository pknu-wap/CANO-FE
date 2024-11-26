import 'dart:convert';

import 'package:cano/data/model/user_info/user_info.dart';
import 'package:cano/data/repository/user/cano_user_repository.dart';
import 'package:cano/utils/format_string.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../desginsystem/strings.dart';
import '../../utils/image_utils.dart';

class UserInfoViewmodel extends StateNotifier<UserInfo> {
  UserInfoViewmodel._internal(super.state);

  static final UserInfoViewmodel _instance =
      UserInfoViewmodel._internal(UserInfo(
    name: "",
    profileImageUrl: null,
    acidity: null,
    body: null,
    bitterness: null,
    sweetness: null,
    aroma: [],
  ));

  factory UserInfoViewmodel() {
    return _instance;
  }

  static final canoUserRepository = CanoUserRepository();

  void setUserInfo(UserInfo userInfo) {
    state = userInfo;
  }

  void setName(String newName) {
    state = state.copyWith(name: newName);
  }

  void setProfileImageUrl(String? newUrl) {
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

  Future<void> pickProfileImage(BuildContext context) async {
    setProfileImageUrl(await pickImageFromGallery(context));
  }

  Future<bool> modifiyUserInfo() async {
    final jsonData = {
      AppStrings.nameEng: state.name,
      AppStrings.acidityEng: state.acidity == null
          ? null
          : intensityLevelToRequest(state.acidity!.description),
      AppStrings.bodyEng: state.body == null
          ? null
          : intensityLevelToRequest(state.body!.description),
      AppStrings.bitternessEng: state.bitterness == null
          ? null
          : intensityLevelToRequest(state.bitterness!.description),
      AppStrings.sweetnessEng: state.sweetness == null
          ? null
          : intensityLevelToRequest(state.sweetness!.description),
    };

    final compressedBytes = state.profileImageUrl != null
        ? await compressImageToByte(state.profileImageUrl!)
        : null;
    final tempFile = compressedBytes != null
        ? await saveCompressedImage(compressedBytes)
        : null;

    final formData = FormData.fromMap({
      "dto": MultipartFile.fromString(
        jsonEncode(jsonData),
        contentType: DioMediaType.parse("application/json"),
      ),
      "image":
          tempFile != null ? await MultipartFile.fromFile(tempFile.path) : null
    });

    return await canoUserRepository.modifiyUserInfo(formData);
  }
}

final userInfoProvider =
    StateNotifierProvider.autoDispose<UserInfoViewmodel, UserInfo>(
  (ref) => UserInfoViewmodel(),
);
