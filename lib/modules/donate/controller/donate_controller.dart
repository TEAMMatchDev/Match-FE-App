import 'package:get/get.dart';

import '../../../model/today_project/today_project.dart';

class DonateController extends GetxController {
  RxInt selectIdx = 0.obs;
  Rx<bool> isRecent = false.obs;

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
  }
}
