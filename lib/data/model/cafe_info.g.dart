// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafe_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CafeInfoImpl _$$CafeInfoImplFromJson(Map<String, dynamic> json) =>
    _$CafeInfoImpl(
      cafeName: json['cafeName'] as String,
      rating: (json['rating'] as num).toDouble(),
      ratingCount: (json['ratingCount'] as num).toInt(),
      isLike: json['isLike'] as bool,
      likeCount: (json['likeCount'] as num).toInt(),
      cafeImageUrl: json['cafeImageUrl'] as String,
    );

Map<String, dynamic> _$$CafeInfoImplToJson(_$CafeInfoImpl instance) =>
    <String, dynamic>{
      'cafeName': instance.cafeName,
      'rating': instance.rating,
      'ratingCount': instance.ratingCount,
      'isLike': instance.isLike,
      'likeCount': instance.likeCount,
      'cafeImageUrl': instance.cafeImageUrl,
    };
