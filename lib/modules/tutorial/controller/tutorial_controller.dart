import 'package:get/get.dart';
import 'package:match/model/recommend_project/recommend_project.dart';

import '../../../model/enum/project_type.dart';
import '../../../provider/api/tutorial_api.dart';
import '../../../util/const/global_mock_data.dart';

class TutorialController extends GetxController {
  Rx<int> selectTypeIdx = (-1).obs;
  Rx<RecommendProject> selectProject = tmpRecommendProject.obs;
  RxList<RecommendProject> projectTypes = <RecommendProject>[].obs;

  @override
  void onInit() async {
    super.onInit();
    projectTypes.assignAll(await TutorialApi.getRecommendProjects());
  }
}
