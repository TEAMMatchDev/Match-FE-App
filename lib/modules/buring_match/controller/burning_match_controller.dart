import 'package:get/get.dart';
import 'package:match/model/flame_detail/flame_detail.dart';
import 'package:match/model/match_history/match_history.dart';
import 'package:match/model/match_pay/match_pay.dart';
import 'package:match/provider/api/flame_api.dart';

import '../../../provider/api/project_api.dart';
import '../../../util/const/global_mock_data.dart';

enum MATCH_STATUS {
  //검색에서 접근
  DONAITON,
  //시작 전
  REGULAR_PAY,
}

class BurningMatchController extends GetxController {
  static BurningMatchController get to => Get.find();
  int id = Get.arguments["donaionId"] ?? 0;

  // 공유하기 로직때문에 추가했던 변수<- 임시 삭제
  // int projectId = Get.arguments["projectId"] ?? -1;

  ///*5-10-1 상단 매치 정보
  Rx<FlameDetail> flameDetail = tmpFlameDetail.obs;

  ///* mapIndexed 사용불가로 index 대체 변수
  RxList<MatchHistory> matchHistories = <MatchHistory>[].obs;

  // Future<void> getMoreProject(int index) async {
  //   if (!DonationApi.getDonationHistoryIsLast) {
  //     matchHistories.addAll(
  //         await DonationApi.getDonationHistory(donationId: id, page: index));
  //   }
  // }

  @override
  void onInit() async {
    super.onInit();
    flameDetail.value =
        await FlameApi.getDetailFlameTop(donationId: id) ?? tmpFlameDetail;
  }
}
