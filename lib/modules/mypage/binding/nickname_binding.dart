import 'package:get/get.dart';
import 'package:match/modules/mypage/controller/nickname_controller.dart';

class NicknameBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NickNameController());
  }
}
