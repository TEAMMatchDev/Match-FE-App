import 'package:get/get.dart';

import '../controller/alarm_detail_controller.dart';

class AlarmDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AlarmDetailController());
  }
}
