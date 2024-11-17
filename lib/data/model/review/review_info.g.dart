// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewInfoImpl _$$ReviewInfoImplFromJson(Map<String, dynamic> json) =>
    _$ReviewInfoImpl(
      userName: json['userName'] as String,
      rating: json['rating'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      reviewText: json['reviewText'] as String,
      reviewImageUrl: (json['reviewImageUrl'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      acidity: $enumDecodeNullable(_$IntensitylevelEnumMap, json['acidity']),
      body: $enumDecodeNullable(_$IntensitylevelEnumMap, json['body']),
      bitterness:
          $enumDecodeNullable(_$IntensitylevelEnumMap, json['bitterness']),
      sweetness:
          $enumDecodeNullable(_$IntensitylevelEnumMap, json['sweetness']),
      aroma: (json['aroma'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$AromaEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$ReviewInfoImplToJson(_$ReviewInfoImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'rating': instance.rating,
      'timestamp': instance.timestamp.toIso8601String(),
      'reviewText': instance.reviewText,
      'reviewImageUrl': instance.reviewImageUrl,
      'acidity': _$IntensitylevelEnumMap[instance.acidity],
      'body': _$IntensitylevelEnumMap[instance.body],
      'bitterness': _$IntensitylevelEnumMap[instance.bitterness],
      'sweetness': _$IntensitylevelEnumMap[instance.sweetness],
      'aroma': instance.aroma?.map((e) => _$AromaEnumMap[e]!).toList(),
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
