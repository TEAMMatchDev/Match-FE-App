import 'package:get/get.dart';
import 'package:match/model/enum/project_type.dart';
import 'package:match/model/project/project.dart';
import 'package:match/provider/api/donation_api.dart';
import 'package:match/provider/api/flame_api.dart';
import 'package:match/provider/api/util/global_api_field.dart';

import '../../../model/flame/flame.dart';
import '../../../model/today_project/today_project.dart';
import '../../../util/const/style/global_logger.dart';

class HomeController extends GetxController {
  //임시 변순
  Rx<bool> isLike = false.obs;
  Rx<int> adCount = 2.obs;
  Rx<String> tmpText = ProjectType.ANIMAL.stateName.obs;
  RxList<Flame> flameList = <Flame>[].obs;

  Future<void> getMoreFlame(int index) async {
    logger.d(
        "2:  총 페이지수 : ${FlameApi.burningFlame.totalCnt ~/ PAGINATION_SIZE}, 불러오고자 하는 페이지: ${FlameApi.burningFlame.currentpage + 1}");
    if (!(FlameApi.burningFlame.totalCnt ~/ PAGINATION_SIZE >=
            FlameApi.burningFlame.currentpage + 1) &&
        !FlameApi.burningFlame.isLast) {
      FlameApi.burningFlame.currentpage++;
      flameList.addAll(await FlameApi.getBurningFlameList(getMore: true));
    }
  }

  @override
  void onInit() async {
    super.onInit();
    flameList.assignAll(await FlameApi.getBurningFlameList());
  }
}
