import 'package:get/get.dart';

import '../controller/payment_controller.dart';

class PaymentBinding implements Bindings {
  @override
  void dependencies() {
    //Get.put((PaymentController()));
    Get.put(PaymentController(), permanent: true); //메모리가 자동으로 지워지지 않게 설정
    //Get.lazyPut(() => PaymentController());
  }
}
