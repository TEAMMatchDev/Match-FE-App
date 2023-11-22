import 'package:get/get.dart';
import 'package:match/provider/api/mypage_api.dart';

import '../../../model/today_project/today_project.dart';
import '../../../provider/api/util/global_api_field.dart';
import '../../../util/const/style/global_logger.dart';

class LikeProjectController extends GetxController {
  RxList<TodayProject> projectList = <TodayProject>[].obs;

  ///* 프로젝트 pagination
  Future<void> getMoreProject({required int index}) async {
    logger.d(
        "2:  총 페이지수 : ${MypageApi.likes.totalCnt ~/ PAGINATION_SIZE}, 불러오고자 하는 페이지: ${index}");
    if (!(MypageApi.likes.totalCnt ~/ PAGINATION_SIZE < index) &&
        !MypageApi.likes.isLast) {
      MypageApi.likes.currentpage = index;
      projectList.addAll(await MypageApi.getLikeList(
        getMore: true,
      ));
    }
  }

  @override
  void onInit() async {
    super.onInit();
    projectList.assignAll(await MypageApi.getLikeList());
  }
}
