import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/components/global_button.dart';

import '../../../util/const/style/global_color.dart';
import '../controller/payment_controller.dart';
import '../widget/payment_widget.dart';

class PaymentScreen extends GetView<PaymentController> {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PaymentController());
    return Scaffold(
      appBar: CommonAppBar.basic("결제 내역"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 30.h),
        child: ListView(
          shrinkWrap: true,
          children: [
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return PaymentListTile(
                    pay: controller.payList[index],
                  );
                }),
                separatorBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 22.h),
                    child: Divider(
                      color: AppColors.divider1,
                      thickness: 1.h,
                    ),
                  );
                }),
                itemCount: controller.payList.length),
            SizedBox(
              height: 20.h,
            ),
            //TODO: fix 0dp
            Expanded(child: Container()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: CommonButton.payment(
                  onTap: (() async {
                    //TODO: 결제방법 변경
                  }),
                  text: "결제 방법 변경"),
            )
          ],
        ),
      ),
    );
  }
}
