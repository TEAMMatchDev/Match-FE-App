import 'package:get/get.dart';
import 'package:match/model/total_pay/total_pay.dart';
import 'package:match/provider/api/payment_api.dart';
import 'package:match/provider/api/project_api.dart';

class TotalPayController extends GetxController {
  RxList<TotalPay> totalPayList = <TotalPay>[].obs;
  @override
  void onInit() async {
    super.onInit();
    totalPayList.assignAll(await PaymentApi.getProjectList());
  }
}
