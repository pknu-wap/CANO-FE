import 'package:freezed_annotation/freezed_annotation.dart';

part 'cafe_info.freezed.dart';
part 'cafe_info.g.dart';

@freezed
class CafeInfo with _$CafeInfo {
  const factory CafeInfo(
      {required String cafeName,
      required double rating,
      required int ratingCount,
      required bool isLike,
      required int likeCount,
      required String cafeImageUrl}) = _CafeInfo;

  factory CafeInfo.fromJson(Map<String, dynamic> json) =>
      _$CafeInfoFromJson(json);
}
