// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_menu_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterMenuRequestImpl _$$RegisterMenuRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterMenuRequestImpl(
      cafeName: json['cafeName'] as String,
      menuName: json['menuName'] as String,
      price: (json['price'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$RegisterMenuRequestImplToJson(
        _$RegisterMenuRequestImpl instance) =>
    <String, dynamic>{
      'cafeName': instance.cafeName,
      'menuName': instance.menuName,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
    };
