import 'package:get/get.dart';
import 'package:match/model/enum/project_type.dart';
import 'package:match/model/project/project.dart';
import 'package:match/provider/api/project_api.dart';

import '../../../model/today_project/today_project.dart';
import '../../../provider/api/util/global_api_field.dart';
import '../../../util/const/style/global_logger.dart';

class DonateController extends GetxController {
  RxInt selectIdx = 0.obs;
  Rx<ProjectType?> selectType = null.obs;
  Rx<bool> isRecent = false.obs;
  Rx<int> startIdx = 0.obs;
  RxList<TodayProject> projectList = <TodayProject>[].obs;

  Future<void> getMoreProject(int index) async {
    logger.d(
        "2:  총 페이지수 : ${ProjectApi.project.totalCnt ~/ PAGINATION_SIZE}, 불러오고자 하는 페이지: ${index}");
    if (!(ProjectApi.project.totalCnt ~/ PAGINATION_SIZE >=
        index) &&
        !ProjectApi.project.isLast) {
      ProjectApi.project.currentpage = index;
      projectList.addAll(await ProjectApi.getProjectList(type:selectType.value,getMore: true));
    }
  }


  @override
  void onInit() async {
    super.onInit();
    projectList.assignAll(await ProjectApi.getProjectList());
  }
}
