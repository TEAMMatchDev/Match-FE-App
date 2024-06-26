import 'package:get/get.dart';
import 'package:match/modules/payment/controller/payment_controller.dart';
import '../controller/user_paymethod_controller.dart';

class UserPayMethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserPayMethodController());
    Get.lazyPut<PaymentController>(() => PaymentController(), fenix: true);
  }
}