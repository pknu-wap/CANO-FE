// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafe_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CafeInfoImpl _$$CafeInfoImplFromJson(Map<String, dynamic> json) =>
    _$CafeInfoImpl(
      name: json['name'] as String,
      location: json['location'] as String,
      rating: (json['rating'] as num).toDouble(),
      favorites: (json['favorites'] as num).toInt(),
      operationHours: json['operationHours'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      menuItems: (json['menuItems'] as List<dynamic>)
          .map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CafeInfoImplToJson(_$CafeInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'rating': instance.rating,
      'favorites': instance.favorites,
      'operationHours': instance.operationHours,
      'tags': instance.tags,
      'menuItems': instance.menuItems,
    };

_$MenuItemImpl _$$MenuItemImplFromJson(Map<String, dynamic> json) =>
    _$MenuItemImpl(
      name: json['name'] as String,
      rating: json['rating'] as String,
      price: json['price'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      isBestSeller: json['isBestSeller'] as bool? ?? false,
    );

Map<String, dynamic> _$$MenuItemImplToJson(_$MenuItemImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'rating': instance.rating,
      'price': instance.price,
      'description': instance.description,
      'image': instance.image,
      'isBestSeller': instance.isBestSeller,
    };
