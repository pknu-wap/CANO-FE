// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuInfoImpl _$$MenuInfoImplFromJson(Map<String, dynamic> json) =>
    _$MenuInfoImpl(
      cafeName: json['cafeName'] as String,
      menuName: json['menuName'] as String,
      price: (json['price'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      ratingCount: (json['ratingCount'] as num).toInt(),
      isLike: json['isLike'] as bool,
      acidity: (json['acidity'] as num).toDouble(),
      body: (json['body'] as num).toDouble(),
      bitterness: (json['bitterness'] as num).toDouble(),
      sweetness: (json['sweetness'] as num).toDouble(),
      aromas:
          (json['aromas'] as List<dynamic>).map((e) => e as String).toList(),
      menuImageUrl: json['menuImageUrl'] as String,
    );

Map<String, dynamic> _$$MenuInfoImplToJson(_$MenuInfoImpl instance) =>
    <String, dynamic>{
      'cafeName': instance.cafeName,
      'menuName': instance.menuName,
      'price': instance.price,
      'rating': instance.rating,
      'ratingCount': instance.ratingCount,
      'isLike': instance.isLike,
      'acidity': instance.acidity,
      'body': instance.body,
      'bitterness': instance.bitterness,
      'sweetness': instance.sweetness,
      'aromas': instance.aromas,
      'menuImageUrl': instance.menuImageUrl,
    };
