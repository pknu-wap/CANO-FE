import 'package:freezed_annotation/freezed_annotation.dart';

part 'cafe_info.freezed.dart';
part 'cafe_info.g.dart';

@freezed
class CafeInfo with _$CafeInfo {
  const factory CafeInfo({
    required String name,
    required String location,
    required double rating,
    required int favorites,
    required String operationHours,
    required List<String> tags,
    required List<MenuItem> menuItems,
  }) = _CafeInfo;

  factory CafeInfo.fromJson(Map<String, dynamic> json) =>
      _$CafeInfoFromJson(json);
}

@freezed
class MenuItem with _$MenuItem {
  const factory MenuItem({
    required String name,
    required String rating,
    required String price,
    required String description,
    required String image,
    @Default(false) bool isBestSeller,
  }) = _MenuItem;

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);
}
