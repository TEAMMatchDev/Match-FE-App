import 'package:get/get.dart';
import 'package:match/model/flame_detail/flame_detail.dart';
import 'package:match/model/match_history/match_history.dart';
import 'package:match/model/match_pay/match_pay.dart';
import 'package:match/provider/api/flame_api.dart';

import '../../../provider/api/project_api.dart';
import '../../../provider/api/util/global_api_field.dart';
import '../../../util/const/global_mock_data.dart';
import '../../../util/const/style/global_logger.dart';

enum MATCH_STATUS {
  //검색에서 접근
  DONAITON,
  //시작 전
  REGULAR_PAY,
}

class BurningMatchController extends GetxController {
  static BurningMatchController get to => Get.find();
  int id = Get.arguments["donaionId"] ?? 0;

  ///*5-10-1 상단 매치 정보
  Rx<FlameDetail> flameDetail = tmpFlameDetail.obs;

  ///* mapIndexed 사용불가로 index 대체 변수
  RxList<MatchHistory> flameHistories = <MatchHistory>[].obs;

  ///<h2> Listview builder에서 호출하는 pagination 추가 호출 함수 </h2>
  ///* 총 데이터 수와 비교하여, 페이지를 더 늘릴수있다면 api 호출, 그렇지 않다면 호출 X
  Future<void> getMoreFlameHistory(int index) async {
    logger.d(
        "2:  총 페이지수 : ${FlameApi.detailFlameBottom.totalCnt ~/ PAGINATION_SIZE}, 불러오고자 하는 페이지: ${index}");
    if (!(FlameApi.burningFlame.totalCnt ~/ PAGINATION_SIZE <
        index) &&
        !FlameApi.burningFlame.isLast) {
      FlameApi.burningFlame.currentpage = index;
      flameHistories.addAll(await FlameApi.getFlameDetailBottomList(donationId: id,getMore: true));
    }
  }

  @override
  void onInit() async {
    super.onInit();
    ///*상단 데이터 init
    flameDetail.value =
        await FlameApi.getDetailFlameTop(donationId: id) ?? tmpFlameDetail;
    ///*하단 데이터 init
    flameHistories.assignAll( await FlameApi.getFlameDetailBottomList(donationId: id));
  }
}
