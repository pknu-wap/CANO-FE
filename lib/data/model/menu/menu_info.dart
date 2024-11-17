import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_info.freezed.dart';
part 'menu_info.g.dart';

@freezed
class MenuInfo with _$MenuInfo {
  const factory MenuInfo(
      {required String cafeName,
      required String menuName,
      required int price,
      required double rating,
      required int ratingCount,
      required bool isLike,
      required double acidity,
      required double body,
      required double bitterness,
      required double sweetness,
      required List<String> aromas,
      Map<String, int>? aromaCounts,
      Map<int, int>? ratingCountsByStar,
      required String menuImageUrl}) = _MenuInfo;

  factory MenuInfo.fromJson(Map<String, dynamic> json) =>
      _$MenuInfoFromJson(json);
}
