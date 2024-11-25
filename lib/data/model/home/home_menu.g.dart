// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeMenuImpl _$$HomeMenuImplFromJson(Map<String, dynamic> json) =>
    _$HomeMenuImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      score: (json['score'] as num?)?.toDouble(),
      attribute: json['attribute'] as String,
      degree: (json['degree'] as num?)?.toDouble(),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$HomeMenuImplToJson(_$HomeMenuImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'score': instance.score,
      'attribute': instance.attribute,
      'degree': instance.degree,
      'imageUrl': instance.imageUrl,
    };
