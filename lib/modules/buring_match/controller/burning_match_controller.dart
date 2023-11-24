import 'package:get/get.dart';
import 'package:match/model/flame_detail/flame_detail.dart';
import 'package:match/model/match_history/match_history.dart';
import 'package:match/provider/api/flame_api.dart';
import '../../../provider/api/util/global_api_field.dart';
import '../../../util/const/global_mock_data.dart';

///* 검색 textfield 상태에 따른 분기처리를 위해
///선언한 enum
enum MatchStatus {
  ///검색에서 접근
  DONAITON,

  ///시작 전
  REGULAR_PAY,
}

class BurningMatchController extends GetxController {
  int id = Get.arguments["donaionId"] ?? 0;

  ///*5-10-1 상단 매치 정보
  Rx<FlameDetail> flameDetail = tmpFlameDetail.obs;

  ///* 5-10-2 하단 매치 정보
  RxList<MatchHistory> flameHistories = <MatchHistory>[].obs;

  ///<h2> Listview builder에서 호출하는 pagination 추가 호출 함수 </h2>
  ///* 총 데이터 수와 비교하여, 페이지를 더 늘릴수있다면 api 호출, 그렇지 않다면 호출 X
  Future<void> getMoreFlameHistory(int index) async {
    if (!FlameApi.burningFlame.isLast) {
      flameHistories.addAll(await FlameApi.getFlameDetailBottomList(
          donationId: id, getMore: true));
    }
  }

  @override
  void onInit() async {
    super.onInit();

    ///*상단 데이터 init
    flameDetail.value =
        await FlameApi.getDetailFlameTop(donationId: id) ?? tmpFlameDetail;

    ///*하단 데이터 init
    flameHistories
        .assignAll(await FlameApi.getFlameDetailBottomList(donationId: id));
  }
}
