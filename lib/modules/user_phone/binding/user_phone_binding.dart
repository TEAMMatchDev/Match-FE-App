import 'package:get/get.dart';

import '../controller/user_phone_controller.dart';

class UserPhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserPhoneController());
  }
}