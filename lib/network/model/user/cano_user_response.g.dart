// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cano_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CanoUserResponseImpl _$$CanoUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CanoUserResponseImpl(
      code: json['code'] as String?,
      message: json['message'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      socialId: (json['socialId'] as num?)?.toInt(),
      profileImageUrl: json['profileImageUrl'] as String?,
      acidity: json['acidity'] as String?,
      body: json['body'] as String?,
      bitterness: json['bitterness'] as String?,
      sweetness: json['sweetness'] as String?,
      onboarded: json['onboarded'] as bool?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$CanoUserResponseImplToJson(
        _$CanoUserResponseImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'name': instance.name,
      'email': instance.email,
      'socialId': instance.socialId,
      'profileImageUrl': instance.profileImageUrl,
      'acidity': instance.acidity,
      'body': instance.body,
      'bitterness': instance.bitterness,
      'sweetness': instance.sweetness,
      'onboarded': instance.onboarded,
      'error': instance.error,
    };
