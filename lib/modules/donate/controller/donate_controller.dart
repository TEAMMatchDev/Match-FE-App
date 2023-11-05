import 'package:get/get.dart';
import 'package:match/model/enum/project_type.dart';
import 'package:match/provider/api/project_api.dart';
import '../../../model/today_project/today_project.dart';
import '../../../provider/api/util/global_api_field.dart';
import '../../../util/const/style/global_logger.dart';

class DonateController extends GetxController {
  /// ▼ 변수

  /// 상단 카테고리 관련 변수
  /// 선택한 카테고리 enum에서 인덱스
  RxInt selectIdx = 0.obs;

  /// 선택한 카테고리 enum type으로 갖고잇는 변수
  Rx<ProjectType?> selectType = null.obs;

  /// 카테고리에 해당하는 project 리스트
  RxList<TodayProject> projectList = <TodayProject>[].obs;

  ///pagination 함수
  Future<void> getMoreProject(int index) async {
    if (!(ProjectApi.project.totalCnt ~/ PAGINATION_SIZE < index) &&
        !ProjectApi.project.isLast) {
      ProjectApi.project.currentpage = index;
      projectList.addAll(await ProjectApi.getProjectList(
          type: selectType.value, getMore: true));
    }
  }

  @override
  void onInit() async {
    super.onInit();
    projectList.assignAll(await ProjectApi.getProjectList());
  }
}
