import 'package:get/get.dart';

import '../controller/event_controller.dart';

class EventBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EventController());
  }
}
