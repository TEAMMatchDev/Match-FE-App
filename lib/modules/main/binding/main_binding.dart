import 'package:get/get.dart';

import '../controller/main_controller.dart';

class MainBiding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
