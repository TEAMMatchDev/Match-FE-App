import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';
import 'package:logger/logger.dart';
import 'package:match/modules/onboarding/binding/onboarding_binding.dart';
import 'package:match/util/method/dynamic_link.dart';

import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'provider/routes/pages.dart';
import 'util/const/style/global_color.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //splash 안없어지게 : preserve / 없어지게 : remove
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove(); //preserve(widgetsBinding: widgetsBinding);

  await dotenv.load(fileName: ".env");
/*
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();
  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    kakaoApiKey: dotenv.env['kakaoApiKey'],
    javaScriptAppKey: dotenv.env['javaScriptAppKey'],
  );
*/
  await initService();
  runApp(const MyApp());
}

//초기 구동
Future<void> initService() async {
  //* Widget Binding 초기화
  WidgetsFlutterBinding.ensureInitialized();
  //* 카카오  SDK 초기화
  KakaoSdk.init(nativeAppKey: dotenv.env['kakaoApiKey']!);
  //* firebase dynamic link 초기화
  await Firebase.initializeApp();
  await DynamicLink.setUp();

  /// * GetStorage 초기화
  await GetStorage.init();
}

Future<void> initialDynamicLink(BuildContext context) async {}

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
