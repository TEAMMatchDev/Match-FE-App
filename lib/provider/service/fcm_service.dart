// It is assumed that all messages contain a data field with the key 'type'
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:match/provider/routes/routes.dart';

import '../../util/const/style/global_logger.dart';

Future<void> setupInteractedMessage() async {
  RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();

  if (initialMessage != null) {
    _handleMessage(initialMessage);
  }
  FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
}

void _handleMessage(RemoteMessage message) {
  logger.d(message);
  Get.toNamed(Routes.alarm);
}
