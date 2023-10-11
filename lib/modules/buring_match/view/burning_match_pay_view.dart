import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/util/components/global_app_bar.dart';

import '../../../util/const/style/global_color.dart';
import '../controller/burning_match_controller.dart';
import '../widget/burning_match_widget.dart';

class BurningMatchPayScreen extends GetView<BurningMatchController> {
  const BurningMatchPayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar.basic("진행중인 매치"),
        body: ListView.separated(
            itemBuilder: ((context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: BurningMatchCredit(
                  title: "불타는 매치",
                  date: "2021.09.01",
                  type: "불타는 매치",
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
