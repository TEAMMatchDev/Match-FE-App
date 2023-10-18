import 'package:flutter/material.dart';
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
      final result = await Permission.storage.request();
      return false;
    } else {
      return true;
    }
  }
}
