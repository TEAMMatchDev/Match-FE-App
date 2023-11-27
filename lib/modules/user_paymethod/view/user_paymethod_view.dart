import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:match/modules/payment/controller/payment_controller.dart';
import 'package:match/modules/payment/widget/card_slider_widget.dart';
import 'package:match/modules/user_paymethod/controller/user_paymethod_controller.dart';
import 'package:match/modules/user_phone/controller/user_phone_controller.dart';
import 'package:match/provider/api/mypage_api.dart';
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
    PaymentController paymentController = Get.find();
    paymentController.onInit();

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
            Obx(
              () => CommonButton.deletePay(
                isActive: paymentController.isDeleteAble.value, // controller.isDeleteAble.value, // 카드 개수가 0 이 아니면
                onTap: () async {
                  print('>>> 삭제할 cardId: ${paymentController.cardId.value}');

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
