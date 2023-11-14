import 'package:get/get.dart';

import '../../../model/today_project/today_project.dart';

class LikeProjectController extends GetxController{
  RxList<TodayProject> projectList = <TodayProject>[].obs;
  @override
  void onInit() {
    super.onInit();
    //TODO: get 찜한 프로젝트 리스트
  }
}