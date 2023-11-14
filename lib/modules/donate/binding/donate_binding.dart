import 'package:get/get.dart';

import '../controller/donate_controller.dart';

class DonateBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DonateController());
  }
}
