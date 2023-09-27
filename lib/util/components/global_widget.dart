import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

Widget TypeChip({required String type}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
    decoration: BoxDecoration(
      color: AppColors.grey0,
      borderRadius: BorderRadius.circular(4.r),
    ),
    child: Text(type,
        style: AppTextStyles.body3Bold12.copyWith(
          color: AppColors.grey6,
        )),
  );
}
