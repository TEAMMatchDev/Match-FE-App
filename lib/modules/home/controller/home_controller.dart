import 'package:get/get.dart';
import 'package:match/model/enum/project_type.dart';
import 'package:match/model/project/project.dart';

import '../../../model/today_project/today_project.dart';

class HomeController extends GetxController {
  //임시 변순
  Rx<bool> isLike = false.obs;
  Rx<int> adCount = 2.obs;
  Rx<String> tmpText = ProjectType.ANIMAL.stateName.obs;

  RxList<TodayProject> projectList = <TodayProject>[
    TodayProject(
        projectId: 2,
        imgUrl:
            "https://match-image.s3.ap-northeast-2.amazonaws.com/project/2/61519f9b-4741-4fdc-82ad-fccf3217d6c1.png",
        title: "TBT 유기견 보호",
        usages: "The Better Tommorow",
        kind: "ELDER",
        like: true,
        userProfileImages: [
          "https://phinf.pstatic.net/contact/20220316_168/1647357936388otkFi_JPEG/image.jpg",
          "https://phinf.pstatic.net/contact/20220316_168/1647357936388otkFi_JPEG/image.jpg",
          "https://match-image.s3.ap-northeast-2.amazonaws.com/profile.png"
        ],
        totalDonationCnt: 7),
    TodayProject(
        projectId: 1,
        imgUrl:
            "https://match-image.s3.ap-northeast-2.amazonaws.com/project/2/61519f9b-4741-4fdc-82ad-fccf3217d6c1.png",
        title: "TBT 유기견 보호1",
        usages: "The Better Tommorow",
        kind: "ELDER",
        like: true,
        userProfileImages: [
          "https://phinf.pstatic.net/contact/20220316_168/1647357936388otkFi_JPEG/image.jpg",
          "https://phinf.pstatic.net/contact/20220316_168/1647357936388otkFi_JPEG/image.jpg",
          "https://match-image.s3.ap-northeast-2.amazonaws.com/profile.png"
        ],
        totalDonationCnt: 8),
  ].obs;
  @override
  void onInit() {
    super.onInit();
    Project testProject = Project(
        projectId: 1,
        imgUrl:
            "https//match-image.s3.ap-northeast-2.amazonaws.com/project/1/ef29a128-b689-4ffc-a2f8-d67acf7298ca.png",
        title: "TBT 유기견 보호1",
        usages: "The Better Tommorow",
        kind: ProjectType.ANIMAL.toString(),
        like: false);
  }
}
