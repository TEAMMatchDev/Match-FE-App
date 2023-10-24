import 'package:get/get.dart';
import 'package:match/modules/donate/controller/donate_controller.dart';
import 'package:match/modules/event/controller/event_controller.dart';
import 'package:match/modules/home/controller/home_controller.dart';
import 'package:match/modules/main/controller/main_controller.dart';
import 'package:match/modules/mypage/controller/mypage_controller.dart';

import '../controller/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(LoginController());
    Get.put(HomeController());

    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => DonateController());
    Get.lazyPut(() => EventController());
    Get.lazyPut(() => MypageController());
  }
}