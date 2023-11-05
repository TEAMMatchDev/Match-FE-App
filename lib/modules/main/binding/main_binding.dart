import 'package:get/get.dart';
import 'package:match/modules/donate/controller/donate_controller.dart';
import 'package:match/modules/event/controller/event_controller.dart';

import '../../../provider/service/auth_service.dart';
import '../../home/controller/home_controller.dart';
import '../controller/main_controller.dart';

///<h2>로그인- 회원가입 이후에 실행되는 binding</h2>
///* 탭에 있는 화면에 대한 controller와 AuthService 초기화
class MainBiding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController());

    Get.put(AuthService());
    Get.put(HomeController());
    Get.lazyPut(() => DonateController());
    Get.lazyPut(() => EventController());
  }
}
