import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:match/model/card_info/card_info.dart';
import 'package:match/modules/payment/controller/payment_controller.dart';
import 'package:match/modules/payment/widget/card_slider_widget.dart';
import 'package:match/modules/user_paymethod/controller/user_paymethod_controller.dart';
import 'package:match/modules/user_phone/controller/user_phone_controller.dart';
import 'package:match/provider/api/mypage_api.dart';
import 'package:match/provider/api/order_api.dart';
import 'package:match/provider/routes/routes.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../provider/service/auth_service.dart';
import '../../../util/components/gloabl_text_field.dart';
import '../../../util/components/global_button.dart';
import '../../../util/const/style/global_logger.dart';

class UserPayMethodScreen extends GetView<UserPayMethodController> {
  const UserPayMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentController paymentController = Get.find<PaymentController>();

    paymentController.loadData();
    paymentController.accessFrom.value = 'mypage';

    return Scaffold(
      appBar: CommonAppBar.basic("간편결제 관리"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Expanded(
              child: CardSlider(),
            ),
            SizedBox(height: 30.h),
            Obx(() => CommonButton.deletePay(
                isActive: paymentController.isDeleteAble.value,
                onTap: () async {
                  print('>>> 삭제할 cardId: ${paymentController.cardId.value}');

                  var result = await OrderApi.deleteCard(cardId: paymentController.cardId.value);
                  if (result) {
                    Fluttertoast.showToast(msg: "선택한 카드가 삭제 되었습니다.");

                    final PaymentController paymentController = Get.find<PaymentController>();
                    List<CardInfo> newCardInfoList = await OrderApi.getCardList();
                    paymentController.cardInfoList.assignAll(newCardInfoList);
                    paymentController.cardCodeList.assignAll(
                        newCardInfoList.map((card) => card.cardCode.toString()).toList()
                    );
                    paymentController.cardNumList.assignAll(
                        newCardInfoList.map((card) => card.cardNo).toList()
                    );

                    Get.forceAppUpdate();
                  } else {
                    Fluttertoast.showToast(msg: "카드 삭제를 실패했습니다.");
                  }
                },
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}