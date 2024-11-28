// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewInfoImpl _$$ReviewInfoImplFromJson(Map<String, dynamic> json) =>
    _$ReviewInfoImpl(
      id: (json['id'] as num).toInt(),
      memberName: json['memberName'] as String,
      contents: json['contents'] as String,
      score: (json['score'] as num).toDouble(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      acidity: $enumDecodeNullable(_$IntensityLevelEnumMap, json['acidity']),
      body: $enumDecodeNullable(_$IntensityLevelEnumMap, json['body']),
      bitterness:
          $enumDecodeNullable(_$IntensityLevelEnumMap, json['bitterness']),
      sweetness:
          $enumDecodeNullable(_$IntensityLevelEnumMap, json['sweetness']),
      aroma: (json['aroma'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$AromaEnumMap, e))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ReviewInfoImplToJson(_$ReviewInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memberName': instance.memberName,
      'contents': instance.contents,
      'score': instance.score,
      'images': instance.images,
      'acidity': _$IntensityLevelEnumMap[instance.acidity],
      'body': _$IntensityLevelEnumMap[instance.body],
      'bitterness': _$IntensityLevelEnumMap[instance.bitterness],
      'sweetness': _$IntensityLevelEnumMap[instance.sweetness],
      'aroma': instance.aroma?.map((e) => _$AromaEnumMap[e]!).toList(),
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$IntensityLevelEnumMap = {
  IntensityLevel.none: 'none',
  IntensityLevel.low: 'low',
  IntensityLevel.medium: 'medium',
  IntensityLevel.high: 'high',
  IntensityLevel.veryHigh: 'veryHigh',
};

const _$AromaEnumMap = {
  Aroma.woody: 'woody',
  Aroma.mild: 'mild',
  Aroma.nutty: 'nutty',
  Aroma.grain: 'grain',
  Aroma.smmothGrain: 'smmothGrain',
  Aroma.almond: 'almond',
  Aroma.cocoa: 'cocoa',
  Aroma.spicy: 'spicy',
  Aroma.caramel: 'caramel',
};
