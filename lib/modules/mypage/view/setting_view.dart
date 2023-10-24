import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../util/components/global_widget.dart';
import '../../../util/const/style/global_color.dart';

class SettingScreen extends StatelessWidget {
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
                  SwitchListTile(
                      isSwitch: Rx<bool>(true), title: "서비스 알림받기"),
                  Divider(thickness: 1.h,height:1.h,color: AppColors.divider1,),
                  SwitchListTile(
                      isSwitch: Rx<bool>(true), title: "이벤트 알림받기"),
                ],
              )),
          GreySizedBox()
        ],
      ),
    );
  }

  Widget SwitchListTile({required Rx<bool> isSwitch, required String title}) {
    return Obx(
      ()=> Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.S1SemiBold14.copyWith(color: AppColors.grey7),
            ),
            //TODO: GetStorage 저장 및 서버 연결(기획 확인 필요)
            CupertinoSwitch(
                activeColor: AppColors.grey9,
                dragStartBehavior: DragStartBehavior.start,
                value: isSwitch.value,
                onChanged: (bool isOn) {
                  isSwitch.value = isOn;
                })
          ],
        ),
      ),
    );
  }
}
