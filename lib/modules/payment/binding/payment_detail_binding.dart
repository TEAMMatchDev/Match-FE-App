import 'package:get/get.dart';

import '../controller/payment_detail_controller.dart';

class PaymentDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PaymentDetailController());
  }
}
