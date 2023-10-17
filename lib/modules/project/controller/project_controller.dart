import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match/model/enum/search_statu.dart';
import 'package:match/model/project_detail/project_detail.dart';
import 'package:match/model/project_history.dart/project_history.dart';
import 'package:match/util/const/global_mock_data.dart';

import '../../../model/comment/comment.dart';
import '../../../provider/api/project_api.dart';
import '../../../provider/api/util/global_api_field.dart';
import '../../../util/const/style/global_logger.dart';

class MatchTabBar extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: 2);
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
  Rx<bool> isStretched = true.obs;
  Rx<ScrollController> scrollController = ScrollController().obs;
  Rx<ProjectDetail> projectDetail = tmpProjectDetail.obs;
  RxList<ProjectHistory> projectHistories = <ProjectHistory>[].obs;

  Future<void> getProjectHistory() async {
    projectHistories.assignAll(
        await ProjectApi.getProjectHistoryList(projectId: projectId));
  }

  Future<void> getMoreProjectHistory({required int index}) async {
    logger.d(
        "2:  총 페이지수 : ${ProjectApi.project.totalCnt ~/ PAGINATION_SIZE}, 불러오고자 하는 페이지: ${index}");
    if (!(ProjectApi.project.totalCnt ~/ PAGINATION_SIZE >= index) &&
        !ProjectApi.project.isLast) {
      ProjectApi.project.currentpage = index;
      searchStatus.value = SEARCH_STATUS.SEARCH;
      projectHistories.addAll(await ProjectApi.getProjectHistoryList(
        projectId: projectId,
        getMore: true,
      ));
    }
  }

  //* 댓글
  Rx<TextEditingController> commentTextController = TextEditingController().obs;
  Rx<SEARCH_STATUS> searchStatus = SEARCH_STATUS.INIT.obs;

  @override
  void onInit() async {
    // TODO projectId로 서버에서 데이터 가져오기ㄴ
    matchTabBar = Get.put(MatchTabBar());
    projectDetail.value =
        await ProjectApi.getProjectDetail(projectId: projectId) ??
            tmpProjectDetail;
    super.onInit();
  }
  //TODO: 페이지 전환시 상세페이지 변수 초기화
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    // projectDetail.value.clear();
  }
}
