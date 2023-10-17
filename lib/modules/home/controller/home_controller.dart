import 'package:get/get.dart';
import 'package:match/model/enum/project_type.dart';
import 'package:match/model/project/project.dart';

import '../../../model/flame/flame.dart';
import '../../../model/today_project/today_project.dart';

class HomeController extends GetxController {
  //임시 변순
  Rx<bool> isLike = false.obs;
  Rx<int> adCount = 2.obs;
  Rx<String> tmpText = ProjectType.ANIMAL.stateName.obs;

  RxList<Flame> flameList = <Flame>[].obs;

  @override
  void onInit() {}
}
