// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_review_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserReviewInfoImpl _$$UserReviewInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserReviewInfoImpl(
      id: (json['id'] as num).toInt(),
      memberName: json['memberName'] as String?,
      contents: json['contents'] as String?,
      score: (json['score'] as num).toDouble(),
      acidity: json['acidity'] as String?,
      body: json['body'] as String?,
      bitterness: json['bitterness'] as String?,
      sweetness: json['sweetness'] as String?,
      memberId: (json['memberId'] as num).toInt(),
      menuId: (json['menuId'] as num).toInt(),
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$UserReviewInfoImplToJson(
        _$UserReviewInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memberName': instance.memberName,
      'contents': instance.contents,
      'score': instance.score,
      'acidity': instance.acidity,
      'body': instance.body,
      'bitterness': instance.bitterness,
      'sweetness': instance.sweetness,
      'memberId': instance.memberId,
      'menuId': instance.menuId,
      'imageUrls': instance.imageUrls,
      'createdAt': instance.createdAt,
    };
