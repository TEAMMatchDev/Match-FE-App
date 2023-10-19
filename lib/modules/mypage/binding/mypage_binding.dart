import 'package:get/get.dart';
import 'package:match/modules/mypage/controller/nickname_controller.dart';

import '../controller/mypage_controller.dart';

class MypageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MypageController());
    Get.put(NickNameController());
  }
}
