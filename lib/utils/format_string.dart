import '../desginsystem/strings.dart';

String formatWithComma(int number) {
  return number.toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
        (match) => '${match[1]},',
      );
}

String joinWithComma(List<String> strings) {
  return strings.join(', ');
}

String? intensityLevelToRequest(String description) {
  const map = {
    AppStrings.none: AppStrings.NONE,
    AppStrings.weak: AppStrings.LOW,
    AppStrings.normal: AppStrings.MEDIUM,
    AppStrings.strong: AppStrings.HIGH,
    AppStrings.veryStrong: AppStrings.VERY_HIGH,
  };
  return map[description];
}
