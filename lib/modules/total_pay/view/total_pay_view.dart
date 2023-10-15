import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/modules/total_pay/controller/total_pay_controller.dart';

import '../../../util/components/global_app_bar.dart';
import '../../../util/const/style/global_color.dart';
import '../widget/total_pay_widget.dart';

class TotalPayScreen extends GetView<TotalPayController> {
  const TotalPayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar.basic("기부 내역"),
        body: Obx(
          () => ListView.separated(
            itemCount: controller.totalPayList.length,
            itemBuilder: ((context, index) {
              final pay = controller.totalPayList[index];
              final regular = pay.regularStatus.replaceAll(" ", " • ");
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: MatchPayItem(
                  title: pay.projectName,
                  date: pay.donationDate,
                  type: pay.donationStatus,
                  regular: regular,
                  regularPayId: pay.donationId,
                ),
              );
            }),
            separatorBuilder: ((context, index) {
              return Container(
                margin:
                    EdgeInsets.symmetric(vertical: 20.h).copyWith(bottom: 0.h),
                color: AppColors.searchBackground,
                height: 10.h,
              );
            }),
          ),
        ));
  }
}
