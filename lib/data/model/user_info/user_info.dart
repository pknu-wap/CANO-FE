import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo(
      {required String name,
      required int age,
      required List<String> coffees,
      required List<String> keywords,
      required String area,
      required bool? gender,
      required String profileImageUrl}) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
