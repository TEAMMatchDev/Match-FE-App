import 'package:get/get.dart';
import 'package:match/model/match_history/match_history.dart';
import 'package:match/provider/api/payment_api.dart';

import '../../../model/pay/pay.dart';

class PaymentController extends GetxController {
  //int id = Get.arguments["regulaPayId"] ?? -1;
  int id = (Get.arguments != null && Get.arguments.containsKey("regulaPayId")) ? Get.arguments["regulaPayId"] : -1;

  RxList<Pay> payList = <Pay>[].obs;

  /// 동의항목
  var selectedItems = <String>[].obs;

  @override
  void onInit() async {
    super.onInit();
    payList.assignAll(await PaymentApi.getPaymentDetail(regularPayId: id));
  }
}
