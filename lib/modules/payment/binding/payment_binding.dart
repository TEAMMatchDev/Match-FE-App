import 'package:get/get.dart';

import '../controller/payment_controller.dart';

class PaymentBinding implements Bindings {
  @override
  void dependencies() {
    Get.put((PaymentController()));
  }
}
