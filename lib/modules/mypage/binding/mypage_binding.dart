import 'package:get/get.dart';

import '../controller/mypage_controller.dart';

class MypageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MypageController());
  }
}
