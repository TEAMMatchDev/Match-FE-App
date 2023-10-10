import 'package:get/get.dart';
import 'package:match/model/enum/project_type.dart';
import 'package:match/model/project/project.dart';
import 'package:match/provider/api/project_api.dart';

import '../../../model/today_project/today_project.dart';

class DonateController extends GetxController {
  RxInt selectIdx = 0.obs;
  Rx<bool> isRecent = false.obs;

  RxList<TodayProject> projectList = <TodayProject>[].obs;
  @override
  void onInit() async {
    super.onInit();
    projectList
        .assignAll(await ProjectApi.getProjectList(type: ProjectType.ANIMAL));
  }
}
