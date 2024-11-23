import 'dart:convert';

import 'package:cano/data/model/register_menu/register_menu_request.dart';
import 'package:cano/data/repository/register_menu/register_menu_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../desginsystem/strings.dart';
import '../../utils/image_utils.dart';

class RegisterMenuViewmodel extends StateNotifier<RegisterMenuRequest> {
  RegisterMenuViewmodel._internal(super.state);

  static final RegisterMenuViewmodel _instance =
      RegisterMenuViewmodel._internal(const RegisterMenuRequest(
          cafeName: "", menuName: "", price: 0, imageUrl: null));

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

    final compressedBytes = state.imageUrl != null
        ? await compressImageToByte(state.imageUrl!)
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

  void setImageUrl(String? url) {
    state = state.copyWith(imageUrl: url);
  }

  Future<void> pickMenuImage(BuildContext context) async {
    setImageUrl(await pickImageFromGallery(context));
  }
}

final registerMenuProvider =
    StateNotifierProvider<RegisterMenuViewmodel, RegisterMenuRequest>(
        (ref) => RegisterMenuViewmodel());
