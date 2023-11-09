import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:match/model/card_info/card_info.dart';
import 'package:match/model/match_history/match_history.dart';
import 'package:match/modules/project/controller/project_controller.dart';
import 'package:match/provider/api/order_api.dart';
import 'package:match/provider/api/payment_api.dart';
import 'package:match/util/const/global_mock_data.dart';
import 'package:match/util/const/style/global_logger.dart';

import '../../../model/pay/pay.dart';
import '../../../model/donator/donator.dart';

class PaymentController extends GetxController {
  //TODO) 주석처리 한 거로 로그인 api 연결 후 수정 필요
  //int id = Get.arguments["regularPayId"] ?? -1;
  int id = (Get.arguments != null && Get.arguments.containsKey("regularPayId")) ? Get.arguments["regularPayId"] : -1;

  RxList<Pay> payList = <Pay>[].obs;

  final ProjectController _projectController = Get.find<ProjectController>();
  RxString donateState = "".obs; /// 기부상태 (정기/단기)

  //TODO) 후원자 정보
  Rx<Donator> donator = tmpDonator.obs;
  //TODO) 카드 정보
  RxList<CardInfo> cardInfoList = <CardInfo>[].obs;
  RxList<String> cardCodeList = [tmpCardInfo.cardCode].obs;
  RxList<String> cardNumList = [tmpCardInfo.cardNo].obs;
  RxList<int> cardIdList = [tmpCardInfo.id].obs;

  //TODO) 기부금 정보
  final RxBool isPayAbleReg = false.obs;  //금액, 날짜 선택 모두 했는지
  final RxBool isPayAbleConce = false.obs;  //금액 선택 모두 했는지

  final Rx<int> inputValue = 0.obs;
  final Rx<int> selectedAmount = 1000.obs;
  final Rx<int> selectedDate = 1.obs;

  void updateIsPayAbleReg() { /// 금액, 날짜 null 체크
    if (selectedAmount.value > 0 && (selectedDate.value >= 1 && selectedDate.value <= 31)) {
      isPayAbleReg.value = true;
    } else {
      isPayAbleReg.value = false;
    }
  }
  void updateIsPayAbleOnce() { /// 금액 null 체크
    if (selectedAmount.value > 0) {
      isPayAbleReg.value = true;
    } else {
      isPayAbleReg.value = false;
    }
  }


  //TODO) 결제 정보
  /// 동의항목
  var selectedItems = <String>[].obs;
  /// 카드등록 화면 --현재 선택된 카드사의 인덱스
  RxInt selectedCardIndex = (-1).obs;
  void selectCard(int index) {
    selectedCardIndex.value = index;
  }
  /// 결제할 카드 & 프로젝트 정보
  RxInt cardId = 1.obs;

  //TODO) 카드 신규 등록
  /// 카드 번호
  Rx<TextEditingController> cardNumTextController = TextEditingController().obs;
  /// 유효기간
  Rx<TextEditingController> cardExpTextController = TextEditingController().obs;
  /// CVC
  Rx<TextEditingController> cardCVCTextController = TextEditingController().obs;
  /// 생년월일
  Rx<TextEditingController> cardUserBirthTextController = TextEditingController().obs;
  /// 카드 비밀번호 todo- ** 로 표시
  Rx<TextEditingController> cardPWTextController = TextEditingController().obs;

  @override
  void onInit() async {
    super.onInit();
    payList.assignAll(await PaymentApi.getPaymentDetail(regularPayId: id));
    cardInfoList.assignAll(await OrderApi.getCardList());
    cardCodeList.assignAll(cardInfoList.map((card) => card.cardCode.toString()).toList());
    cardNumList.assignAll(cardInfoList.map((card) => card.cardNo).toList());
    cardIdList.assignAll(cardInfoList.map((card) => card.id).toList());

    donateState.value = _projectController.projectDetail.value.regularStatus;
  }
}
