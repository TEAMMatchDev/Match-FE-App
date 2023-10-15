import 'package:get/get.dart';
import 'package:match/model/match_history/match_history.dart';
import 'package:match/model/match_pay/match_pay.dart';
import 'package:match/provider/api/donation_api.dart';

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

  ///*5-7-1 상단 매치 결제 정보
  Rx<MatchPay> matchPay = tmpMatchPay.obs;

  ///* mapIndexed 사용불가로 index 대체 변수
  RxList<MatchHistory> matchHistories = <MatchHistory>[].obs;
  Future<void> getMoreProject(int index) async {
    if (!DonationApi.getDonationHistoryIsLast) {
      matchHistories.addAll(
          await DonationApi.getDonationHistory(donationId: id, page: index));
    }
  }

  @override
  void onInit() async {
    super.onInit();
    matchHistories
        .assignAll(await DonationApi.getDonationHistory(donationId: id));
  }
}
