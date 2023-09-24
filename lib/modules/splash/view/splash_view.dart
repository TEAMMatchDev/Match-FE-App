import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match/provider/routes/pages.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../provider/routes/routes.dart';
import '../controller/splash_controller.dart';

/**
 * 온보딩 화면
 */
class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          //splash~login -> main~후원 디테일 작업 영역 분리를 위해
          //라우팅 설정
          child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.main);
              },
              child: Text('splash'))),
    );
  }
}
