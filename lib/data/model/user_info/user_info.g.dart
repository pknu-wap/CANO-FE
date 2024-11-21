// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      name: json['name'] as String,
      acidity: $enumDecodeNullable(_$IntensitylevelEnumMap, json['acidity']),
      body: $enumDecodeNullable(_$IntensitylevelEnumMap, json['body']),
      bitterness:
          $enumDecodeNullable(_$IntensitylevelEnumMap, json['bitterness']),
      sweetness:
          $enumDecodeNullable(_$IntensitylevelEnumMap, json['sweetness']),
      aroma: (json['aroma'] as List<dynamic>)
          .map((e) => $enumDecodeNullable(_$AromaEnumMap, e))
          .toList(),
      profileImageUrl: json['profileImageUrl'] as String,
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'acidity': _$IntensitylevelEnumMap[instance.acidity],
      'body': _$IntensitylevelEnumMap[instance.body],
      'bitterness': _$IntensitylevelEnumMap[instance.bitterness],
      'sweetness': _$IntensitylevelEnumMap[instance.sweetness],
      'aroma': instance.aroma.map((e) => _$AromaEnumMap[e]).toList(),
      'profileImageUrl': instance.profileImageUrl,
    };

const _$IntensitylevelEnumMap = {
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
