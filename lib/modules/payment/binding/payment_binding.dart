import 'package:get/get.dart';
import 'package:match/modules/project/controller/project_controller.dart';
import 'package:match/modules/signIn/controller/login_controller.dart';

import '../controller/payment_controller.dart';

class PaymentBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PaymentController());
    //Get.put(ProjectController());
    // Get.put(LoginController(), permanent: true);
    Get.lazyPut<PaymentController>(() => PaymentController());
    //Get.put(PaymentController(), permanent: true); //메모리가 자동으로 지워지지 않게 설정
    //Get.lazyPut(() => PaymentController());
  }
}
