import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

Future<String?> pickImageFromGallery(BuildContext context) async {
  final ImagePicker _picker = ImagePicker();

  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    String imagePath = image.path;
    final fileSize = await File(image.path).length();

    print("갤러리 파일 크기: ${fileSize / 1024} KB");
    print("갤러리 파일 크기: ${fileSize / (1024 * 1024)} MB");

    return imagePath;
  }

  return null;
}

Future<List<int>> compressImageToByte(String imagePath) async {
  final compressedImage = await FlutterImageCompress.compressWithFile(imagePath,
      quality: 70, format: CompressFormat.jpeg);

  print("압축된 파일 크기: ${compressedImage!.lengthInBytes / 1024} KB");
  return List<int>.from(compressedImage);
}

Future<File> saveCompressedImage(List<int> bytes) async {
  final tempDir = await getTemporaryDirectory();
  final tempFile = File('${tempDir.path}/compressed_image.jpg');
  await tempFile.writeAsBytes(bytes);
  return tempFile;
}