// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
      coffees:
          (json['coffees'] as List<dynamic>).map((e) => e as String).toList(),
      keywords:
          (json['keywords'] as List<dynamic>).map((e) => e as String).toList(),
      area: json['area'] as String,
      gender: json['gender'] as bool?,
      profileImageUrl: json['profileImageUrl'] as String,
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'coffees': instance.coffees,
      'keywords': instance.keywords,
      'area': instance.area,
      'gender': instance.gender,
      'profileImageUrl': instance.profileImageUrl,
    };
