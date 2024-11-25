import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_response.freezed.dart';
part 'search_response.g.dart';

@freezed
class SearchResponse with _$SearchResponse {
  const factory SearchResponse(
      {required int id,
      required int price,
      required String name,
      required double? score,
      required int? scoreCount,
      required bool? isLike,
      required double? acidity,
      required double? body,
      required double? bitterness,
      required double? sweetness,
      required Map<String, int>? aromas,
      required String imageUrl}) = _SearchResponse;

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
}
