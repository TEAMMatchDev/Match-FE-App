import 'package:get/get.dart';
import 'package:match/model/match_history/match_history.dart';

import '../../../model/pay/pay.dart';

class PaymentController extends GetxController {
  RxList<Pay> payList = <Pay>[
    Pay(
        payDate: "2023.8.31",
        payStatus: "결제완료",
        payMethod: "신용카드",
        amount: "1,000원"),
    Pay(
        payDate: "2023.8.31",
        payStatus: "결제완료",
        payMethod: "신용카드",
        amount: "1,000원"),
    Pay(
        payDate: "2023.8.31",
        payStatus: "결제완료",
        payMethod: "신용카드",
        amount: "1,000원"),
    Pay(
        payDate: "2023.8.31",
        payStatus: "결제완료",
        payMethod: "신용카드",
        amount: "1,000원"),
    Pay(
        payDate: "2023.8.31",
        payStatus: "결제완료",
        payMethod: "신용카드",
        amount: "1,000원"),
  ].obs;
  @override
  void onInit() {
    super.onInit();
  }
}
