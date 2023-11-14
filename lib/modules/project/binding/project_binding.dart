import 'package:get/get.dart';
import 'package:match/modules/payment/controller/payment_controller.dart';

import '../controller/project_controller.dart';

class ProjectBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProjectController());
    Get.lazyPut(() => PaymentController());
  }
}
