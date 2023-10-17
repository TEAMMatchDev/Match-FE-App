import 'package:get/get.dart';

import '../controller/total_pay_controller.dart';

class TotalPayBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TotalPayController());
  }
}
