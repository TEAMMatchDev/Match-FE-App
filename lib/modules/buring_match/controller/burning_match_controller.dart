import 'package:get/get.dart';
import 'package:match/model/match_history/match_history.dart';
import 'package:match/model/match_pay/match_pay.dart';

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
  Rx<MatchPay> matchPay = MatchPay(
          imgUrl:
              "https://match-image.s3.ap-northeast-2.amazonaws.com/project/3/f33573ca-ed8e-4c50-ad35-cfb4e18899bf.png",
          projectTitle: "프로젝트 타이틀",
          amount: 3000,
          regularPayId: 4,
          payDate: 18)
      .obs;

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
