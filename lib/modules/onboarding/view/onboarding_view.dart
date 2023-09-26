import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/modules/onboarding/widget/onboarding_widget.dart';
import 'package:match/provider/routes/routes.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import '../../../util/const/style/global_color.dart';

import '../controller/onboarding_controller.dart';

/**
 * 온보딩 화면
 */
class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        /// splash~login -> main~후원 디테일 작업 영역 분리를 위해
        /// 라우팅 설정
        child: SizedBox(

            child: OnboardingWidget(),
          )
      ),
    );
  }

}
