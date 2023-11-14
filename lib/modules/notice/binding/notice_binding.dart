import 'package:get/get.dart';

import '../controller/notice_controller.dart';

class NoticeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NoticeController());
  }
}
