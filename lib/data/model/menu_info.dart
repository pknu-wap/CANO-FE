import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_info.freezed.dart';
part 'menu_info.g.dart';

@freezed
class MenuInfo with _$MenuInfo {
  const factory MenuInfo(
      {required String cafeName,
      required String menuName,
      required String menuInfoText,
      required int price,
      required double rating,
      required int ratingCount,
      required bool isLike,
      required int likeCount,
      required String menuImageUrl}) = _MenuInfo;

  factory MenuInfo.fromJson(Map<String, dynamic> json) =>
      _$MenuInfoFromJson(json);
}