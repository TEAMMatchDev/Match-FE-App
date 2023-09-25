import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../provider/routes/routes.dart';
import '../controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        /// splash~login -> main~후원 디테일 작업 영역 분리를 위해
        /// 라우팅 설정
          child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.home);
              },
              child: Text('login'))),
    );
  }

}