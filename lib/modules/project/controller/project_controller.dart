import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match/model/project_detail/project_detail.dart';
import 'package:match/model/project_history.dart/project_history.dart';

class MatchTabBar extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: 3);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

class ProjectController extends GetxController {
  static ProjectController get to => Get.find();
  int projectId = Get.arguments["projectId"] ?? 0;
  RxInt tabIndex = 0.obs;
  late final MatchTabBar matchTabBar;
  Rx<bool> isLike = true.obs;
  Rx<ProjectDetail> projectDetail = ProjectDetail(
          projectId: 1,
          thumbNail:
              "https://match-image.s3.ap-northeast-2.amazonaws.com/project/1/1fd4cf5b-1863-432f-8277-f51bccd0c3e6.png",
          projectImgList: [
            ProjectImage(
                imgId: 1,
                imgUrl:
                    "https://match-image.s3.ap-northeast-2.amazonaws.com/project/1/ef29a128-b689-4ffc-a2f8-d67acf7298ca.png",
                sequence: 1),
            ProjectImage(
                imgId: 2,
                imgUrl:
                    "https://match-image.s3.ap-northeast-2.amazonaws.com/project/1/89e68cbb-c823-44f3-b9d2-71a670453ea2.png",
                sequence: 2),
            ProjectImage(
                imgId: 3,
                imgUrl:
                    "https://match-image.s3.ap-northeast-2.amazonaws.com/project/1/ca123e30-d9de-4ca1-8721-17b2a2044f68.png",
                sequence: 3),
            ProjectImage(
                imgId: 4,
                imgUrl:
                    "https://match-image.s3.ap-northeast-2.amazonaws.com/project/1/d8ffb3b0-edfe-44de-85a2-fcd5781a0d70.jpeg",
                sequence: 4),
            ProjectImage(
                imgId: 5,
                imgUrl:
                    "https://match-image.s3.ap-northeast-2.amazonaws.com/project/1/cb1bfdeb-97ef-4984-b3d3-a84d86e68223.png",
                sequence: 5),
            ProjectImage(
                imgId: 6,
                imgUrl:
                    "https://match-image.s3.ap-northeast-2.amazonaws.com/project/1/d83a35e3-d0fa-4857-baef-4b2ca2995391.png",
                sequence: 6)
          ],
          title: "TBT 유기견 보호1",
          usages: "The Better Tommorow",
          like: false,
          userProfileImages: [
            "http://k.kakaocdn.net/dn/bq8XQY/btsjqweTr1J/c0kplPW8eo8iOCeoYTBGxK/img_640x640.jpg",
            "https://phinf.pstatic.net/contact/20220316_168/1647357936388otkFi_JPEG/image.jpg",
            "https://phinf.pstatic.net/contact/20220316_168/1647357936388otkFi_JPEG/image.jpg"
          ],
          totalDonationCnt: 4,
          kind: "DOG",
          regularStatus: "REGULAR")
      .obs;
  RxList<ProjectHistory> tmpProjectHistories = <ProjectHistory>[
    ProjectHistory(
        historyId: 18,
        historyStatus: "CREATE",
        histories: "임현우님의 불꽃이 탄생했습니다.",
        historyDate: "2023.10.5 10:42",
        profileImageUrl:
            "https://phinf.pstatic.net/contact/20220316_168/1647357936388otkFi_JPEG/image.jpg",
        nickname: "임현우"),
    ProjectHistory(
        historyId: 19,
        historyStatus: "CREATE",
        histories: "임현우님의 불꽃이 탄생했습니다.",
        historyDate: "2023.10.5 10:43",
        profileImageUrl:
            "https://phinf.pstatic.net/contact/20220316_168/1647357936388otkFi_JPEG/image.jpg",
        nickname: "임현우"),
  ].obs;
  @override
  void onInit() {
    // TODO projectId로 서버에서 데이터 가져오기ㄴ
    matchTabBar = Get.put(MatchTabBar());
    super.onInit();
  }
}
