import 'package:get/get.dart';
import 'package:match/model/recommend_project/recommend_project.dart';

import '../../../model/enum/project_type.dart';
import '../../../provider/api/tutorial_api.dart';

class TutorialController extends GetxController {
  RxInt selectTypeIdx = (-1).obs;
  Rx<RecommendProject>? selectProject;
  List<RecommendProject> projectTypes = [];

  @override
  void onInit() async {
    super.onInit();
    projectTypes.assignAll(await TutorialApi.getRecommendProjects());
  }
}
