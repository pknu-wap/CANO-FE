String formatWithComma(int number) {
  return number.toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
        (match) => '${match[1]},',
      );
}

String joinWithComma(List<String> strings) {
  return strings.join(', ');
}
