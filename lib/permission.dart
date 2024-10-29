// Future<void> requestPermission() async {
//   var status = await Permission.storage.status;
//   if (status.isDenied) {
//     PermissionStatus request = await Permission.storage.request();
//     print("권한 요청 확인");
//   }

// Map<Permission, PermissionStatus> statuses = await [
//   Permission.mediaLibrary,
//   Permission.storage,
// ].request();

// print("권한 요청 확인: ${statuses[Permission.photos]}");
// }
