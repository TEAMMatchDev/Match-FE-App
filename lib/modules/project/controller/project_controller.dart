import 'package:get/get.dart';

class ProjectController extends GetxController {
  static ProjectController get to => Get.find();
  int projectId = Get.arguments["projectId"] ?? 0;
  Rx<bool> isLike = true.obs;
  @override
  void onInit() {
    // TODO projectId로 서버에서 데이터 가져오기ㄴ
    super.onInit();
  }
}
