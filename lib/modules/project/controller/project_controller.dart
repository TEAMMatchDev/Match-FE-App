import 'package:get/get.dart';

class ProjectController extends GetxController {
  static ProjectController get to => Get.find();

  Rx<bool> isLike = true.obs;
}
