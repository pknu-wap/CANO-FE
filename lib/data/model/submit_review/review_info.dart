import 'package:cano/data/model/user_info/user_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_info.freezed.dart';
part 'review_info.g.dart';

@freezed
class ReviewInfo with _$ReviewInfo {
  const factory ReviewInfo({
    required int id,
    required String memberName,
    required String contents,
    required double score,
    required List<String>? images,
    required Intensitylevel? acidity,
    required Intensitylevel? body,
    required Intensitylevel? bitterness,
    required Intensitylevel? sweetness,
    required List<Aroma?> aroma,
    required DateTime createdAt,
  }) = _ReviewInfo;

  factory ReviewInfo.fromJson(Map<String, dynamic> json) =>
      _$ReviewInfoFromJson(json);
}
