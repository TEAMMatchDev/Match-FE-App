import 'package:get/get.dart';
import 'package:match/modules/donate/controller/donate_controller.dart';
import 'package:match/modules/event/controller/event_controller.dart';

import '../../home/controller/home_controller.dart';
import '../../mypage/controller/mypage_controller.dart';
import '../controller/main_controller.dart';

class MainBiding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(MainController());
    Get.lazyPut(() => DonateController());
    Get.lazyPut(() => EventController());
    Get.lazyPut(() => MypageController());
  }
}
