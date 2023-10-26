import 'package:get/get.dart';
import 'package:match/modules/mypage/controller/setting_controller.dart';


class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SettingController());
  }
}
