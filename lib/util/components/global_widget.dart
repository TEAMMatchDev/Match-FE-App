import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../const/global_variable.dart';

Widget TypeChip({required String type}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
    decoration: BoxDecoration(
      color: AppColors.grey0,
      borderRadius: BorderRadius.circular(4.r),
    ),
    child: Text(type,
        style: AppTextStyles.T1Bold12.copyWith(
          color: AppColors.grey6,
        )),
  );
}
