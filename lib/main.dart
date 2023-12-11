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
import 'package:match/provider/api/util/dio_services.dart';
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
  //* Widget Binding 초기화및 splash 화면
  var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //* 카카오  SDK 초기화
  KakaoSdk.init(nativeAppKey: dotenv.env['kakaoApiKey']!);
  //* firebase dynamic link 초기화
  await Firebase.initializeApp();

  /// * GetStorage 초기화
  await GetStorage.init();
  var reulst = await DynamicLink.setUp();
  logger.e("dynamicc link initialized ; $reulst");

  // 푸시 알림 설정 및 권한 요청
  await requestPermission();

  //알림 클릭시 접근할때 token 저장
  String? token = await GetStorageUtil.getToken(StorageKey.ACCESS_TOKEN);
  if (token != null) {
    DioServices().setAccessToken(token);
  }
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
  if (message.notification != null) {
    logger.d(message.notification!.title);
    logger.d(message.notification!.body);
    FcmService.showNotification(
        title: message.notification!.title ?? "",
        content: message.notification!.body ?? "");
  }
}

// 알림권한 관련 APNS 토큰 발급 코드
Future<void> requestPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
    provisional: false,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
    // Optionally handle the case where the user granted permission
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
    // Optionally handle the case where the user granted provisional permission
  } else {
    print('User declined or has not accepted permission');
    // Optionally handle the case where the user declined or has not accepted permission
  }

  // APNS 토큰 가져오기
  String? apnsToken = await messaging.getAPNSToken();
  if (apnsToken != null) {
    // 여기에서 APNS 토큰을 사용하세요. 예를 들어 서버에 저장하거나 로그로 출력할 수 있습니다.
    print('APNS Token: $apnsToken');
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
