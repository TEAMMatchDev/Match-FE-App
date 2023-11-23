import 'package:get/get.dart';

import '../controller/user_paymethod_controller.dart';

class UserPayMethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserPayMethodController());
  }
}