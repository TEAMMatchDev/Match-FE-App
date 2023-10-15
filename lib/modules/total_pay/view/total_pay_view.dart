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
        body: ListView.separated(
            itemBuilder: ((context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: MatchCredit(
                  title: "불타는 매치",
                  date: "2021.09.01",
                  type: "매치 진행중",
                  day: 30,
                  price: 10000,
                ),
              );
            }),
            separatorBuilder: ((context, index) {
              return Container(
                margin:
                    EdgeInsets.symmetric(vertical: 29.h).copyWith(bottom: 0.h),
                color: AppColors.searchBackground,
                height: 10.h,
              );
            }),
            itemCount: 3));
  }
}
