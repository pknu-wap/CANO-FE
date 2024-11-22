import 'package:freezed_annotation/freezed_annotation.dart';

part 'cano_user_response.freezed.dart';
part 'cano_user_response.g.dart';

@freezed
class CanoUserResponse with _$CanoUserResponse {
  const factory CanoUserResponse(
      {required String code,
      required String message,
      required String? name,
      required String email,
      required int socialId,
      required String? profileImageUrl,
      required String? acidity,
      required String? body,
      required String? bitterness,
      required String? sweetness,
      required bool onboarded,
      required String? error}) = _CanoUserResponse;

  factory CanoUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CanoUserResponseFromJson(json);
}
