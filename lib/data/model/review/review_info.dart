import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_info/user_info.dart';

part 'review_info.freezed.dart';
part 'review_info.g.dart';

@freezed
class ReviewInfo with _$ReviewInfo {
  const factory ReviewInfo({
    required String userName,
    required String rating,
    required DateTime timestamp,
    required String reviewText,
    required List<String> reviewImageUrl,
    required Intensitylevel? acidity,
    required Intensitylevel? body,
    required Intensitylevel? bitterness,
    required Intensitylevel? sweetness,
    required List<Aroma>? aroma,
  }) = _ReviewInfo;

  factory ReviewInfo.fromJson(Map<String, dynamic> json) =>
      _$ReviewInfoFromJson(json);
}
