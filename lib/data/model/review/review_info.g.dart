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
    );

Map<String, dynamic> _$$ReviewInfoImplToJson(_$ReviewInfoImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'rating': instance.rating,
      'timestamp': instance.timestamp.toIso8601String(),
      'reviewText': instance.reviewText,
      'reviewImageUrl': instance.reviewImageUrl,
    };
