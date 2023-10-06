import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:match/util/components/global_modal.dart';
import 'package:permission_handler/permission_handler.dart';

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
    Logger().d(status);
    if (status.isDenied) {
      final result = await Permission.storage.request();
      return false;
    } else {
      return true;
    }
  }
}
