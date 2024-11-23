import 'dart:convert';
import 'dart:io';

import 'package:cano/data/model/user_info/user_info.dart';
import 'package:cano/data/repository/user/cano_user_repository.dart';
import 'package:cano/utils/format_string.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../desginsystem/strings.dart';

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

    final compressedBytes =
        state.profileImageUrl != null ? await _compressImageToByte() : null;
    final tempFile = compressedBytes != null
        ? await _saveCompressedImage(compressedBytes)
        : null;

    final formData = FormData.fromMap({
      "dto": MultipartFile.fromString(
        jsonEncode(jsonData),
        contentType: DioMediaType.parse("application/json"),
      ),
      "image": state.profileImageUrl != null
          ? await MultipartFile.fromFile(tempFile!.path)
          : null
    });

    return await canoUserRepository.modifiyUserInfo(formData);
    //
    // final dto = jsonEncode(jsonData);
    // List<MultipartFile>? imageFile;
    // if (state.profileImageUrl != null) {
    //   imageFile = [await MultipartFile.fromFile(state.profileImageUrl!)];
    // }
    //
    // canoUserRepository.modifiyUserInfo(dto, imageFile);
  }

  Future<List<int>> _compressImageToByte() async {
    final compressedImage = await FlutterImageCompress.compressWithFile(
        state.profileImageUrl!,
        quality: 70,
        format: CompressFormat.jpeg);

    print("압축된 파일 크기: ${compressedImage!.lengthInBytes / 1024} KB");
    return List<int>.from(compressedImage);
  }

  Future<File> _saveCompressedImage(List<int> bytes) async {
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/compressed_image.jpg');
    await tempFile.writeAsBytes(bytes);
    return tempFile;
  }
}

final userInfoProvider =
    StateNotifierProvider.autoDispose<UserInfoViewmodel, UserInfo>(
  (ref) => UserInfoViewmodel(),
);
