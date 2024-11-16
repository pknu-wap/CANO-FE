import 'dart:io';

import 'package:cano/data/model/search/register_menu_request.dart';
import 'package:cano/utils/format_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class RegisterMenuViewmodel extends StateNotifier<RegisterMenuRequest> {
  RegisterMenuViewmodel._internal(super.state);

  static final RegisterMenuViewmodel _instance =
      RegisterMenuViewmodel._internal(const RegisterMenuRequest(
          cafeName: "", menuName: "", price: 0, imageUrl: ""));

  factory RegisterMenuViewmodel() {
    return _instance;
  }

  void setCafeName(String cafeName) {
    state = state.copyWith(cafeName: cafeName);
  }

  void setMenuName(String menuName) {
    state = state.copyWith(menuName: menuName);
  }

  void setPrice(int price) {
    state = state.copyWith(price: price);
  }

  void setImageUrl(String url) {
    state = state.copyWith(imageUrl: url);
  }

  Future<void> pickImageFromGallery(
      BuildContext context, void onSuccess(String)) async {
    final ImagePicker _picker = ImagePicker();

    // 갤러리에서 이미지 선택
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // 선택된 이미지의 경로
      String imagePath = image.path;
      convertToBase64(File(image.path));

      final fileSize = await File(image.path).length();
      print("File size: ${fileSize / 1024} KB");
      print("File size: ${fileSize / (1024 * 1024)} MB");
      onSuccess(imagePath);
    }
  }
}

final registerMenuProvider =
    StateNotifierProvider<RegisterMenuViewmodel, RegisterMenuRequest>(
        (ref) => RegisterMenuViewmodel());
