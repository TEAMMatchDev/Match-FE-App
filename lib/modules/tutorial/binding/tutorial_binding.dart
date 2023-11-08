import 'package:get/get.dart';

import '../controller/tutorial_controller.dart';

class TutorialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TutorialController());
  }
}
