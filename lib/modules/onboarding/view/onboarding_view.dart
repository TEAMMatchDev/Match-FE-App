import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match/provider/routes/routes.dart';
import 'package:match/util/style/global_text_styles.dart';

import '../controller/onboarding_controller.dart';

/**
 * 온보딩 화면
 */
class OnboardingScren extends GetView<OnboardingController> {
  const OnboardingScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        /// splash~login -> main~후원 디테일 작업 영역 분리를 위해
        /// 라우팅 설정
        child: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.login);
          },
          child: Text('onboarding'))),
    );
  }

}
