import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match/model/enum/search_statu.dart';
import 'package:match/model/match_history/match_history.dart';
import 'package:match/provider/api/payment_api.dart';

import '../../../model/pay/pay.dart';

class PaymentController extends GetxController {
  Rx<TextEditingController> cardNumController = TextEditingController().obs;
  Rx<TextEditingController> cardExpController = TextEditingController().obs;
  Rx<TextEditingController> cardCVCController = TextEditingController().obs;
  Rx<TextEditingController> birthController = TextEditingController().obs;
  Rx<TextEditingController> cardPWController = TextEditingController().obs;

  Rx<bool> validNumChange = false.obs;

  Rx<SEARCH_STATUS> searchStatus = SEARCH_STATUS.INIT.obs;


  int id = Get.arguments["regulaPayId"] ?? -1;
  RxList<Pay> payList = <Pay>[].obs;

  void onCardNumberChanged(String newNumber) {
    //TODO) 유효성 검사 / validNumChange 상태 업데이트도 가능합니다.
    print("입력한 카드 번호: $newNumber");
  }

  @override
  void onInit() async {
    super.onInit();
    payList.assignAll(await PaymentApi.getPaymentDetail(regularPayId: id));
  }
}