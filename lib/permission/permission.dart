import 'package:permission_handler/permission_handler.dart';

Future<bool> getGalleryPermissionStatus() async {
  // final galleryPermission = Permission.photos;
  // if (await galleryPermission.isGranted) return true;
  // return false;
  return true;
}

Future<void> requestGalleryPermission() async {
  final galleryPermission = Permission.photos;
  await galleryPermission.request();
}
