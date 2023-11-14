import 'package:get/get.dart';

import '../controller/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => SearchViewController());
  }
}
