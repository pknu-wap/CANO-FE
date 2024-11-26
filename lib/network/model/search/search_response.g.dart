// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchResponseImpl _$$SearchResponseImplFromJson(Map<String, dynamic> json) =>
    _$SearchResponseImpl(
      id: (json['id'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      name: json['name'] as String,
      score: (json['score'] as num?)?.toDouble(),
      scoreCount: (json['scoreCount'] as num?)?.toInt(),
      isLike: json['isLike'] as bool?,
      acidity: (json['acidity'] as num?)?.toDouble(),
      body: (json['body'] as num?)?.toDouble(),
      bitterness: (json['bitterness'] as num?)?.toDouble(),
      sweetness: (json['sweetness'] as num?)?.toDouble(),
      aromas: (json['aromas'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$SearchResponseImplToJson(
        _$SearchResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'name': instance.name,
      'score': instance.score,
      'scoreCount': instance.scoreCount,
      'isLike': instance.isLike,
      'acidity': instance.acidity,
      'body': instance.body,
      'bitterness': instance.bitterness,
      'sweetness': instance.sweetness,
      'aromas': instance.aromas,
      'imageUrl': instance.imageUrl,
    };
