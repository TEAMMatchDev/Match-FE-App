import 'package:get/get.dart';

import '../controller/notice_detail_controller.dart';

class NoticeDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NoticeDetailController());
  }
}
