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
    };
