import 'package:permission_handler/permission_handler.dart';

// 사진 권한 요청
Future<void> requestPermissions() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.photos,
    Permission.camera,
  ].request();

  // 권한 상태 확인
  final photosPermissionStatus = statuses[Permission.photos];
  final cameraPermissionStatus = statuses[Permission.camera];

  if (photosPermissionStatus!.isGranted && cameraPermissionStatus!.isGranted) {
    // 권한이 허용되었습니다.

  } else {
    // 권한이 거부되었습니다.

  }
}
