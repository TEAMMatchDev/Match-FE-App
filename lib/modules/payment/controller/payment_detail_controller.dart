import 'package:get/get.dart';

import '../../../model/pay/pay.dart';
import '../../../provider/api/payment_api.dart';

class PaymentDetailController extends GetxController{
  var regularPayId = Get.arguments["regularPayId"]?? -1;
  RxList<Pay> payList = <Pay>[].obs;
  @override
  void onInit() async{
    super.onInit();
    payList.assignAll(await PaymentApi.getPaymentDetail(regularPayId: regularPayId));
  }
}