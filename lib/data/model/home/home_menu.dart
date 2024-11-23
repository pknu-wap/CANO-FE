import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_menu.freezed.dart';
part 'home_menu.g.dart';

@freezed
class HomeMenu with _$HomeMenu {
  const factory HomeMenu({
    required int id,
    required String name,
    required double score,
    required String attribute,
    required double degree,
    required String image_url,
  }) = _HomeMenu;

  factory HomeMenu.fromJson(Map<String, dynamic> json) =>
      _$HomeMenuFromJson(json);
}
