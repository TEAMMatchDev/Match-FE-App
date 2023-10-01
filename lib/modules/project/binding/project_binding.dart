import 'package:get/get.dart';

import '../controller/project_controller.dart';

class ProjectBinding implements Bindings {
  @override
  void dependencies() {
    Get.put((ProjectController));
  }
}
