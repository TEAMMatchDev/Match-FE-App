import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';

Widget CommonSectionHeader(
    {required String title, required String destination}) {
  return Padding(
    padding: EdgeInsets.only(top: 31.h, bottom: 17.5.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.heading3Bold,
        ),
        GestureDetector(
            onTap: () async {
              //상세페이지 구현전까지 주석처리
              // await Get.toNamed(destination);
            },
            child: SvgPicture.asset(iconDir + "ic_arrow_right_22.svg"))
      ],
    ),
  );
}
