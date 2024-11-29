import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../desginsystem/strings.dart';

part 'review_info.freezed.dart';
part 'review_info.g.dart';

@freezed
class ReviewInfo with _$ReviewInfo {
  const factory ReviewInfo({
    required int id,
    required String memberName,
    required String contents,
    required double score,
    required List<String>? images,
    IntensityLevel? acidity,
    IntensityLevel? body,
    IntensityLevel? bitterness,
    IntensityLevel? sweetness,
    List<Aroma>? aroma,
    required DateTime createdAt,
  }) = _ReviewInfo;

  factory ReviewInfo.fromJson(Map<String, dynamic> json) =>
      _$ReviewInfoFromJson(json);
}

enum IntensityLevel {
  none("NONE"),
  low("LOW"),
  medium("MEDIUM"),
  high("HIGH"),
  veryHigh("VERY_HIGH");

  final String value;

  const IntensityLevel(this.value);

  static IntensityLevel? fromString(String? value) {
    if (value == null) return null;
    return IntensityLevel.values.firstWhere(
      (level) => level.value == value,
      orElse: () => IntensityLevel.none,
    );
  }
}

enum Aroma {
  woody(AppStrings.woody),
  mild(AppStrings.mild),
  nutty(AppStrings.nutty),
  grain(AppStrings.grain),
  smmothGrain(AppStrings.smmothGrain),
  almond(AppStrings.almond),
  cocoa(AppStrings.cocoa),
  spicy(AppStrings.spicy),
  caramel(AppStrings.caramel);

  final String scent;

  const Aroma(this.scent);

  static Aroma? fromString(String value) {
    switch (value) {
      case AppStrings.woody:
        return Aroma.woody;
      case AppStrings.mild:
        return Aroma.mild;
      case AppStrings.nutty:
        return Aroma.nutty;
      case AppStrings.grain:
        return Aroma.grain;
      case AppStrings.smmothGrain:
        return Aroma.smmothGrain;
      case AppStrings.almond:
        return Aroma.almond;
      case AppStrings.cocoa:
        return Aroma.cocoa;
      case AppStrings.spicy:
        return Aroma.spicy;
      case AppStrings.caramel:
        return Aroma.caramel;
      default:
        return null;
    }
  }
}
