import 'dart:convert';
import 'dart:io';

import 'package:cano/data/model/register_menu/register_menu_request.dart';
import 'package:cano/data/repository/register_menu/register_menu_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../desginsystem/strings.dart';

class RegisterMenuViewmodel extends StateNotifier<RegisterMenuRequest> {
  RegisterMenuViewmodel._internal(super.state);

  static final RegisterMenuViewmodel _instance =
      RegisterMenuViewmodel._internal(const RegisterMenuRequest(
          cafeName: "", menuName: "", price: 0, imageUrl: ""));

  factory RegisterMenuViewmodel() {
    return _instance;
  }

  static final registerMenuRepository = RegisterMenuRepository();

  Future<bool> registerMenu() async {
    final jsonData = {
      AppStrings.cafeNameEng: state.cafeName,
      AppStrings.menuNameEng: state.menuName,
      AppStrings.priceEng: state.price
    };

    final formData = FormData.fromMap({
      "dto": MultipartFile.fromString(
        jsonEncode(jsonData),
        contentType: DioMediaType.parse("application/json"),
      ),
      "image": await MultipartFile.fromFile(state.imageUrl)
    });

    return await registerMenuRepository.registerMenu(formData);
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

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      String imagePath = image.path;
      final fileSize = await File(image.path).length();

      print("갤러리 파일 크기: ${fileSize / 1024} KB");
      print("갤러리 파일 크기: ${fileSize / (1024 * 1024)} MB");

      onSuccess(imagePath);
    }
  }
}

final registerMenuProvider =
    StateNotifierProvider<RegisterMenuViewmodel, RegisterMenuRequest>(
        (ref) => RegisterMenuViewmodel());
