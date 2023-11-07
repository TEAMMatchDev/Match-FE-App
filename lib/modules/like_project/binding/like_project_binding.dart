import 'package:get/get.dart';

import '../controller/like_project_controller.dart';

class LikeProjectBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(LikeProjectController());
  }
}

