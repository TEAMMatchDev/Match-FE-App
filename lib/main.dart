import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';
import 'package:match/modules/onboarding/binding/onboarding_binding.dart';
import 'package:match/provider/api/notification_api.dart';
import 'package:match/provider/service/fcm_service.dart';
import 'package:match/util/const/style/global_logger.dart';
import 'package:match/util/method/dynamic_link.dart';

import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:match/util/method/get_storage.dart';

import 'provider/routes/pages.dart';
import 'util/const/style/global_color.dart';

Future<void> main() async {
  await initService();

  runApp(const MyApp());

  /// * Splash 화면 해제
  FlutterNativeSplash.remove();
}

//초기 구동
Future<void> initService() async {
  await dotenv.load(fileName: ".env");
  Get.put(FcmService());
  //* Widget Binding 초기화및 splash 화면
  var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //* 카카오  SDK 초기화
  KakaoSdk.init(nativeAppKey: dotenv.env['kakaoApiKey']!);
  //* firebase dynamic link 초기화
  await Firebase.initializeApp();

  /// * GetStorage 초기화
  await GetStorage.init();
  await setAlarm();
  await DynamicLink.setUp();
}

Future<String?> initFirebaseMsg() async {
  // FirebaseMessaging 인스턴스 초기화
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // 토큰 얻기
  String? token = await messaging.getToken();
  logger.d('FCM 토큰: $token');
  return token;
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

///* fcm(알람) 관련 권한, 기기 등록 api, listener 등록
Future<void> setAlarm() async {
  ///* alarm 관련 토큰 및 api
  // if (GetStorageUtil.getToken(StorageKey.FCM_TOKEN) != null &&
  //     GetStorageUtil.getToken(StorageKey.DEVICE_ID) != null) {
  // } else {
  var fcmToken = await initFirebaseMsg();
  GetStorageUtil.addToken(StorageKey.FCM_TOKEN, fcmToken ?? "");
  var deviceId = await getDeviceId();
  GetStorageUtil.addToken(StorageKey.DEVICE_ID, deviceId);
  var tmpResult = await NotificationApi.setAlarmToken(
      fcmToken: fcmToken!, deviceId: deviceId);
  logger.d(tmpResult);
  // }
  // await FirebaseMessaging.instance.setAutoInitEnabled(true);
  FirebaseMessaging.instance.onTokenRefresh.listen((token) async {
    logger.w("!!!refreseh Token: $token");
    GetStorageUtil.addToken(StorageKey.FCM_TOKEN, token ?? "");
    var tmpResult = await NotificationApi.setAlarmToken(
        fcmToken: token!, deviceId: deviceId);
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
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  logger.w("!!!Handling a background message: ${message.messageId}");
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: ((context, child) {
          return GetMaterialApp(
            getPages: Pages.routes,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.white,
              fontFamily: 'AppleSDGothicNeo',
            ),
            supportedLocales: const [
              Locale('ko', 'KR'),
            ],
            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            ),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            initialRoute: "/onboarding",
            initialBinding: OnboardingBiding(),
            smartManagement: SmartManagement.full,
            navigatorKey: Get.key,
          );
        }));
  }
}
