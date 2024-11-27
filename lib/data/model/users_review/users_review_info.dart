import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_review_info.freezed.dart';
part 'users_review_info.g.dart';

@freezed
class UsersReviewInfo with _$UsersReviewInfo {
  const factory UsersReviewInfo(
      {required int id,
      required String? memberName,
      required String? contents,
      required double score,
      String? acidity,
      String? body,
      String? bitterness,
      String? sweetness,
      required int memberId,
      required int menuId,
      List<String>? imageUrls,
      required String? createdAt
    }) = _UserReviewInfo;

    factory UsersReviewInfo.fromJson(Map<String, dynamic> json) =>
      _$UsersReviewInfoFromJson(json);
}
