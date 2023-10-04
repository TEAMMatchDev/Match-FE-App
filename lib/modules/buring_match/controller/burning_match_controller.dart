import 'package:get/get.dart';
import 'package:match/model/match_history/match_history.dart';

class BurningMatchController extends GetxController {
  ///* mapIndexed 사용불가로 index 대체 변수
  RxList<MatchHistory> matchHistories = <MatchHistory>[
    //TODO: 테스트용 데이터 | API 연결 이후 삭제
    MatchHistory(
        historyId: 2,
        historyStatus: "CREATE",
        histories: "임현우님의 불꽃이 탄생했습니다.",
        historyDate: "2023.9.18",
        flameImage: null,
        donationHistoryImages: []),
    MatchHistory(
        historyId: 7,
        historyStatus: "CREATE",
        histories: "임현우님의 불꽃이 탄생했습니다.",
        historyDate: "2023.9.18",
        flameImage: null,
        donationHistoryImages: [])
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }
}
