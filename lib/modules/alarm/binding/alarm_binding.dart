import 'package:get/get.dart';

import '../controller/alarm_controller.dart';

class AlarmBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AlarmController());
  }
}
