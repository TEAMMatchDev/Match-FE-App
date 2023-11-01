import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:match/model/match_history/match_history.dart';
import 'package:match/provider/api/payment_api.dart';

import '../../../model/pay/pay.dart';

class PaymentController extends GetxController {
  int id = Get.arguments["regularPayId"] ?? -1;
  RxList<Pay> payList = <Pay>[].obs;

  /// 동의항목
  var selectedItems = <String>[].obs;

  /// 현재 선택된 카드사의 인덱스
  RxInt selectedCardIndex = (-1).obs;
  void selectCard(int index) {
    selectedCardIndex.value = index;
  }

  //TODO) 카드 정보
  // 카드 번호
  Rx<TextEditingController> cardNumTextController = TextEditingController().obs;

  // 유효기간
  Rx<TextEditingController> cardExpTextController = TextEditingController().obs;

  // CVC
  Rx<TextEditingController> cardCVCTextController = TextEditingController().obs;

  // 생년월일
  Rx<TextEditingController> cardUserBirthTextController = TextEditingController().obs;

  // 카드 비밀번호 todo- ** 로 표시
  Rx<TextEditingController> cardPWTextController = TextEditingController().obs;



  @override
  void onInit() async {
    super.onInit();
    payList.assignAll(await PaymentApi.getPaymentDetail(regularPayId: id));
  }
}
