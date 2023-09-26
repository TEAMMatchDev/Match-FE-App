import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:match/provider/routes/pages.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import '../../../provider/routes/routes.dart';

import '../controller/splash_controller.dart';
            
/**
 * 스플레시 화면
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
                Get.toNamed(Routes.onboarding); //Get.toNamed(Routes.main);
              },
            child: SizedBox(

              child: Image.asset(
                imgDir + "logo/iv_home_logo.png",
                width: 120.w,
              ),
            ),
          )
      ),
    );
  }
}
