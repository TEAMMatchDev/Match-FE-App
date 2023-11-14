// It is assumed that all messages contain a data field with the key 'type'
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:match/provider/routes/routes.dart';

import '../../model/enum/alarm_routes.dart';
import '../../util/const/style/global_logger.dart';
import '../../util/method/get_storage.dart';
import '../api/notification_api.dart';

class FcmService extends GetxService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void onInit() async {
    super.onInit();
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('drawable/splash');
    DarwinInitializationSettings iosInitializationSettings =
        const DarwinInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false);
    InitializationSettings initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    await setAlarm();
  }

  static Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  static void _handleMessage(RemoteMessage message) {
    logger.d(message);
    //default 값 선언
    AlarmRoutes alarmRoutes = AlarmRoutes.ALARM_SCREEN;
    message.data.forEach((key, value) {
      logger.d("key: $key, value: $value");

      ///* screen type 변수 업데이트
      if (key == "screen") {
        if (alarmScreen[value] != null) {
          alarmRoutes = alarmScreen[value]!;
        }
      }

      ///* screen arugment에 따라 화면 이동
      if ((alarmRoutes == AlarmRoutes.MATCH_SCREEN ||
              alarmRoutes == AlarmRoutes.MATCH_SCREEN) &&
          key == "projectId") {
        Get.toNamed(alarmRoutes.routes, arguments: {"projectId": value});
      } else if (alarmRoutes == AlarmRoutes.HOME_SCREEN) {
        Get.toNamed(alarmRoutes.routes);
      } else if (alarmRoutes == AlarmRoutes.EVENT_SCREEN && key == "eventId") {
        Get.toNamed(alarmRoutes.routes, arguments: {"eventId": value});
      } else {
        Get.toNamed(Routes.alarm);
      }
    });
  }

  static Future<void> showNotification(
      {required String title, required String content}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel id', 'channel name',
            channelDescription: 'channel description',
            importance: Importance.max,
            priority: Priority.max,
            showWhen: false);
    NotificationDetails notificationDetails = const NotificationDetails(
        android: androidNotificationDetails,
        iOS: DarwinNotificationDetails(badgeNumber: 1));
    await flutterLocalNotificationsPlugin.show(
        0, title, content, notificationDetails);
  }

  Future<String> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.androidId;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    }
    return '';
  }

  Future<String?> initFirebaseMsg() async {
    // FirebaseMessaging 인스턴스 초기화
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // 토큰 얻기
    String? token = await messaging.getToken();
    logger.d('FCM 토큰: $token');
    return token;
  }

  ///* fcm(알람) 관련 권한, 기기 등록 api, listener 등록
  Future<void> setAlarm() async {
    var deviceId = await GetStorageUtil.getToken(StorageKey.DEVICE_ID);
    var token = await GetStorageUtil.getToken(StorageKey.FCM_TOKEN);
    ///* alarm 관련 토큰 및 api
    if ( token != null &&
        deviceId != null) {
    } else {
      var fcmToken = await initFirebaseMsg();
      GetStorageUtil.addToken(StorageKey.FCM_TOKEN, fcmToken ?? "");

      deviceId = await getDeviceId();
      GetStorageUtil.addToken(StorageKey.DEVICE_ID, deviceId);

      var tmpResult = await NotificationApi.setAlarmToken(
          fcmToken: fcmToken ?? "", deviceId: deviceId);
      logger.d(tmpResult);
    }
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    FirebaseMessaging.instance.onTokenRefresh.listen((token) async {
      logger.w("!!!refreseh Token: $token");
      GetStorageUtil.addToken(StorageKey.FCM_TOKEN, token ?? "");
      var tmpResult = await NotificationApi.setAlarmToken(
          fcmToken: token, deviceId: deviceId ?? "");
    }).onError((err) {
      logger.e("!!!refreseh Token: $err");
    });

    ///* alarm listener 등록
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      logger.w("!!!onMessage: $message");
      if (message != null) {
        if (message.notification != null) {
          logger.d(message.notification!.title);
          logger.d(message.notification!.body);
          FcmService.showNotification(
              title: message.notification!.title ?? "",
              content: message.notification!.body ?? "");
        }
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) {
      logger.w("!!!onMessageOpenedApp: $message");
      if (message != null) {
        if (message.notification != null) {
          logger.d(message.notification!.title);
          logger.d(message.notification!.body);
          FcmService.showNotification(
              title: message.notification!.title ?? "",
              content: message.notification!.body ?? "");
        }
      }
    });
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  @pragma('vm:entry-point')
  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage? message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();

    logger.w("!!!Handling a background message: ${message?.messageId}");
    if (message != null) {
      if (message.notification != null) {
        logger.d(message.notification!.title);
        logger.d(message.notification!.body);
        FcmService.showNotification(
            title: message.notification!.title ?? "",
            content: message.notification!.body ?? "");
      }
    }
  }
}
