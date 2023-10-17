import 'package:get/get.dart';

class AlarmDetailController extends GetxController {
  static AlarmDetailController get to => Get.find();
  int id = Get.arguments["id"] ?? 0;
  @override
  void onInit() {
    super.onInit();
  }
}
