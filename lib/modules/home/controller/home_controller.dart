import 'package:get/get.dart';
import 'package:match/model/enum/project_type.dart';
import 'package:match/model/project/project.dart';
import 'package:match/provider/api/donation_api.dart';
import 'package:match/provider/api/flame_api.dart';
import 'package:match/provider/api/util/global_api_field.dart';

import '../../../model/flame/flame.dart';
import '../../../model/today_project/today_project.dart';

class HomeController extends GetxController {
  //임시 변순
  Rx<bool> isLike = false.obs;
  Rx<int> adCount = 2.obs;
  Rx<String> tmpText = ProjectType.ANIMAL.stateName.obs;
  RxList<Flame> flameList = <Flame>[].obs;
  Rx<int> currentPage = 0.obs;

  Future<void> getMoreFlame(int index) async {
    currentPage.value++;
    if (!(FlameApi.burningFlame.totalPage > currentPage.value) &&
        !FlameApi.burningFlame.isLast) {
      flameList.addAll(await FlameApi.getBurningFlameList(getMore: true));
    }
  }

  @override
  void onInit() async {
    super.onInit();
    flameList.assignAll(await FlameApi.getBurningFlameList());
    currentPage.value = FlameApi.burningFlame.currentpage;
  }
}
