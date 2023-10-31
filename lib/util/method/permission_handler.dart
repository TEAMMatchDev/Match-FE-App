import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:match/util/components/global_modal.dart';
import 'package:permission_handler/permission_handler.dart';

import '../const/style/global_logger.dart';

class PermissionHandler {
  static Future<void> requestGallery(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonDialog.galleryPermission(context: context);
        });
  }

  static Future<bool> checkGalleryPermission() async {
    PermissionStatus status = await Permission.storage.request();
    logger.d(status);
    if (status.isDenied) {
      await Permission.storage.request();
      return false;
    } else {
      Fluttertoast.showToast(msg: "갤러리 사진 권한이 허용되었습니다");
      return true;
    }
  }
  static Future<void> checkAlarmPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    logger.d('User granted permission: ${settings.authorizationStatus}');
    Fluttertoast.showToast(msg: "알림 권한이 허용되었습니다");

  }
}
