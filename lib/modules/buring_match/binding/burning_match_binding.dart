import 'package:get/get.dart';

import '../controller/burning_match_controller.dart';

class BurningMatchBinding implements Bindings {
  @override
  void dependencies() {
    Get.put((BurningMatchController));
  }
}
