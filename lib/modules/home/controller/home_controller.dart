import 'package:get/get.dart';
import 'package:match/model/project/project.dart';

class HomeController extends GetxController {
  //임시 변순
  Rx<bool> isLike = false.obs;
  Rx<int> adCount = 2.obs;
  RxString text = ''.obs;
  @override
  void onInit() {
    super.onInit();
    Project testProject = Project(
        projectId: 1,
        imgUrl:
            "https//match-image.s3.ap-northeast-2.amazonaws.com/project/1/ef29a128-b689-4ffc-a2f8-d67acf7298ca.png",
        title: "TBT 유기견 보호1",
        usages: "The Better Tommorow",
        kind: "DOG",
        like: false);
    text.value = testProject.kind;
  }
}
