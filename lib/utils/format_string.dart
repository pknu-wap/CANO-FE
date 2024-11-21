import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

String formatWithComma(int number) {
  return number.toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
        (match) => '${match[1]},',
      );
}

String joinWithComma(List<String> strings) {
  return strings.join(', ');
}

void convertToBase64(File image) async {
  final bytes = await image.readAsBytes();
  String base64String = base64Encode(bytes);
  print("Base64 String: $base64String");

  final directory = await getApplicationDocumentsDirectory();

  final filePath = '${directory.path}/test.txt';

  // 파일 쓰기
  final file = File(filePath);
  await file.writeAsString(base64String);
}
