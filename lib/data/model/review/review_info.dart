import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _ReviewInfo;

  factory ReviewInfo.fromJson(Map<String, dynamic> json) =>
      _$ReviewInfoFromJson(json);
}
