import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_info.freezed.dart';
part 'menu_info.g.dart';

@freezed
class MenuInfo with _$MenuInfo {
  const factory MenuInfo({
    required int id,
    required String name,
    required int price,
    double? score, 
    int? scoreCount,
    bool? isLike,
    double? acidity,
    double? body,
    double? bitterness, 
    double? sweetness,
    List<String>? aromas,
    Map<String, int>? aromaCounts,
    Map<int, int>? ratingCountsByStar,
    required String imageUrl, 
  }) = _MenuInfo;

  factory MenuInfo.fromJson(Map<String, dynamic> json) =>
      _$MenuInfoFromJson(json);
}
