import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_menu_request.freezed.dart';
part 'register_menu_request.g.dart';

@freezed
class RegisterMenuRequest with _$RegisterMenuRequest {
  const factory RegisterMenuRequest({
    required String cafeName,
    required String menuName,
    required int price,
    required String imageUrl,
  }) = _RegisterMenuRequest;

  factory RegisterMenuRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterMenuRequestFromJson(json);
}
