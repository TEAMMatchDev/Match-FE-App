import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/modules/alarm/view/alarm_detail_view.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/components/global_widget.dart';
import '../controller/alarm_controller.dart';

class AlarmScreen extends GetView<AlarmController> {
  const AlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar.basic("알림"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView.separated(
            itemCount: 3,
            itemBuilder: (context, index) {
              return CommonListItem(
                category: "알림 소분류",
                title: "알림 제목",
                date: "2023.04.13",
                onTap: () async {
                  Get.to(() => AlarmDetailScreen(
                        alarmId: 1,
                      ));
                },
              );
            },
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              );
            },
          ),
        ));
  }
}
