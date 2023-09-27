import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match/util/const/style/global_color.dart';

import '../const/style/global_text_styles.dart';

class CommonButton extends StatelessWidget {
  final Future<void> Function() onTap;
  final String text;
  const CommonButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 17.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.grey1),
              borderRadius: BorderRadius.circular(10.r)),
          child: Text(text, style: AppTextStyles.subtitle2Bold14),
        ));
  }
}
