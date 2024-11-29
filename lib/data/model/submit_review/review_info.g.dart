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
      acidity: $enumDecodeNullable(_$IntensitylevelEnumMap, json['acidity']),
      body: $enumDecodeNullable(_$IntensitylevelEnumMap, json['body']),
      bitterness:
          $enumDecodeNullable(_$IntensitylevelEnumMap, json['bitterness']),
      sweetness:
          $enumDecodeNullable(_$IntensitylevelEnumMap, json['sweetness']),
      aroma: (json['aroma'] as List<dynamic>)
          .map((e) => $enumDecodeNullable(_$AromaEnumMap, e))
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
      'acidity': _$IntensitylevelEnumMap[instance.acidity],
      'body': _$IntensitylevelEnumMap[instance.body],
      'bitterness': _$IntensitylevelEnumMap[instance.bitterness],
      'sweetness': _$IntensitylevelEnumMap[instance.sweetness],
      'aroma': instance.aroma.map((e) => _$AromaEnumMap[e]).toList(),
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$IntensitylevelEnumMap = {
  Intensitylevel.none: 'none',
  Intensitylevel.weak: 'weak',
  Intensitylevel.normal: 'normal',
  Intensitylevel.strong: 'strong',
  Intensitylevel.veryStrong: 'veryStrong',
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
