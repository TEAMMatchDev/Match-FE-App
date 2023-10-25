import 'package:get/get.dart';

import '../controller/event_detail_controller.dart';

class EventDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EventDetailController());
  }
}
