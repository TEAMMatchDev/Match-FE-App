import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../provider/routes/routes.dart';
import '../const/global_variable.dart';

Widget TypeChip(
    {required String type,
    Color color = AppColors.grey0,
    Color textColor = AppColors.grey6,
    int horizontalPadding = 8,
    int verticalPadding = 4}) {
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding.w, vertical: verticalPadding.h),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(4.r),
    ),
    child: Text(type,
        style: AppTextStyles.T1Bold12.copyWith(
          color: textColor,
        )),
  );
}

Widget GreySizedBox() {
  return Container(
    color: AppColors.searchBackground,
    height: 10.h,
  );
}

/// <h2> 알림 버튼 </h2>
Widget alarmButton() {
  return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.alarm);
      },
      child: SvgPicture.asset(
        iconDir + "ic_alarm_20.svg",
        width: 20.w,
      ));
}

Widget CommonListItem({
  required Future<void> Function() onTap,
  required String category,
  required String title,
  required String date,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: AppTextStyles.S1SemiBold13.copyWith(color: AppColors.grey5),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(title, style: AppTextStyles.T1Bold15),
        SizedBox(
          height: 6.h,
        ),
        Text(
          date,
          style: AppTextStyles.S1SemiBold12.copyWith(
            color: AppColors.grey3,
          ),
        ),
      ],
    ),
  );
}
