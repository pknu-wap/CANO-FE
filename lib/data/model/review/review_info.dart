import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cano/desginsystem/strings.dart';

part 'review_info.freezed.dart';
part 'review_info.g.dart';


@freezed
class ReviewInfo with _$ReviewInfo {
  const factory ReviewInfo({
    required String userName,
    required String rating,
    required DateTime timestamp,
    required String reviewText,
    required List<String> reviewImageUrl, 
    required Intensitylevel? acidity,
    required Intensitylevel? body,
    required Intensitylevel? bitterness,
    required Intensitylevel? sweetness,
    required List<Aroma>? aroma,
  }) = _ReviewInfo;

  factory ReviewInfo.fromJson(Map<String, dynamic> json) =>
      _$ReviewInfoFromJson(json);
}


enum Intensitylevel {
  none(AppStrings.none),
  weak(AppStrings.weak),
  normal(AppStrings.normal),
  strong(AppStrings.strong),
  veryStrong(AppStrings.veryStrong);

  final String description;

  const Intensitylevel(this.description);

  static Intensitylevel? fromString(String value) {
    switch (value) {
      case AppStrings.none:
        return Intensitylevel.none;
      case AppStrings.weak:
        return Intensitylevel.weak;
      case AppStrings.normal:
        return Intensitylevel.normal;
      case AppStrings.strong:
        return Intensitylevel.strong;
      case AppStrings.veryStrong:
        return Intensitylevel.veryStrong;
      default:
        return null;
    }
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

