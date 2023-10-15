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
      appBar: CommonAppBar.basic("상세 정보"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 30.h),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
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
            ),
          ],
        ),
      ),
    );
  }
}
