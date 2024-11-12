// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuInfoImpl _$$MenuInfoImplFromJson(Map<String, dynamic> json) =>
    _$MenuInfoImpl(
      cafeName: json['cafeName'] as String,
      menuName: json['menuName'] as String,
      menuInfoText: json['menuInfoText'] as String,
      price: (json['price'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      ratingCount: (json['ratingCount'] as num).toInt(),
      isLike: json['isLike'] as bool,
      likeCount: (json['likeCount'] as num).toInt(),
      menuImageUrl: json['menuImageUrl'] as String,
      aroma: (json['aroma'] as List<dynamic>).map((e) => e as String).toList(),
      ratingCountsByStar:
          (json['ratingCountsByStar'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), (e as num).toInt()),
      ),
      flavorCounts: (json['flavorCounts'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      aromaCounts: Map<String, int>.from(json['aromaCounts'] as Map),
    );

Map<String, dynamic> _$$MenuInfoImplToJson(_$MenuInfoImpl instance) =>
    <String, dynamic>{
      'cafeName': instance.cafeName,
      'menuName': instance.menuName,
      'menuInfoText': instance.menuInfoText,
      'price': instance.price,
      'rating': instance.rating,
      'ratingCount': instance.ratingCount,
      'isLike': instance.isLike,
      'likeCount': instance.likeCount,
      'menuImageUrl': instance.menuImageUrl,
      'aroma': instance.aroma,
      'ratingCountsByStar':
          instance.ratingCountsByStar.map((k, e) => MapEntry(k.toString(), e)),
      'flavorCounts': instance.flavorCounts,
      'aromaCounts': instance.aromaCounts,
    };
