import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/provider/api/util/pagination_function.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/components/global_widget.dart';
import '../../../provider/api/util/global_api_field.dart';
import '../../../provider/routes/routes.dart';
import '../../../util/const/style/global_logger.dart';
import '../controller/alarm_controller.dart';

class AlarmScreen extends GetView<AlarmController> {
  const AlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar.basic("알림"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 30.h),
          child: ListView.separated(
            itemCount: controller.notifcationList.length,
            itemBuilder: (context, index) {
              getMoreData(
                  index: index,
                  totalCnt: controller.notifcationList.length,
                  getMore: controller.getMoreNotification);
              final alarm = controller.notifcationList[index];
              return CommonListItem(
                category: alarm.notificationsType,
                title: alarm.title,
                date: alarm.notificationsDate,
                onTap: () async {
                  Get.toNamed(Routes.alarm_detail,
                      arguments: {"id": alarm.notificationId});
                },
              );
            },
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: const Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              );
            },
          ),
        ));
  }
}
