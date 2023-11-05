import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/modules/mypage/controller/setting_controller.dart';
import 'package:match/provider/api/notification_api.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../model/enum/alarm_type.dart';
import '../../../util/components/global_widget.dart';
import '../../../util/const/style/global_color.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.basic("환경설정"),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ).copyWith(top: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "알림",
                    style: AppTextStyles.T1Bold15,
                    textAlign: TextAlign.start,
                  ),
                  switchListTile(
                      isSwitch: controller.servicePermission,
                      alarmType: AlarmType.SERVICE),
                  Divider(
                    thickness: 1.h,
                    height: 1.h,
                    color: AppColors.divider1,
                  ),
                  switchListTile(
                      isSwitch: controller.eventPermission,
                      alarmType: AlarmType.EVENT),
                ],
              )),
          GreySizedBox()
        ],
      ),
    );
  }

  Widget switchListTile(
      {required Rx<bool> isSwitch, required AlarmType alarmType}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${alarmType.stateName} 알림받기",
              style:
                  AppTextStyles.S1SemiBold14.copyWith(color: AppColors.grey7),
            ),
            CupertinoSwitch(
                activeColor: AppColors.grey9,
                dragStartBehavior: DragStartBehavior.start,
                value: isSwitch.value,
                onChanged: (bool isOn) async {
                  isSwitch.value = isOn;
                  await NotificationApi.setAlarmPermission(type: alarmType);
                })
          ],
        ),
      ),
    );
  }
}
