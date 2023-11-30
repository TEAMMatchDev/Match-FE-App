import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/modules/total_pay/controller/total_pay_controller.dart';

import '../../../model/enum/regular_pay_status.dart';
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
              final regularInfo = "매월 • ${pay.payDate}일 • ${pay.amount}";
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: MatchPayItem(
                  title: pay.projectTitle,
                  date: pay.regularDate,
                  type: regularPayStatusMap[pay.regularPayStatus] ??
                      RegularPayStatus.PROCEEDING,
                  regularInfo: regularInfo,
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
