//TODO: add survey modal
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:match/util/const/global_variable.dart';

import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';

Widget SurveyModal({required String title, required int surveyId}) {
  return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
      ),
      title: Text("'${title}'\n정기 후원이 집행 완료되었습니다🎉",
          textAlign: TextAlign.center, style: AppTextStyles.T1Bold16),
      titlePadding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 30.w)
          .copyWith(bottom: 0.h),
      content: IntrinsicHeight(
          child: Column(children: [
        Text(
          "MATCH와 함께 한 후원 마음에 드셨나요?",
          style: AppTextStyles.S1SemiBold14.copyWith(color: AppColors.grey7),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 27.h,
        ),
        Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.black,
            ),
            child: thumbsTextButton(icon: "up", text: "좋아요")),
        SizedBox(
          height: 14.h,
        ),
        thumbsTextButton(icon: "down", text: "아니요", color: AppColors.grey5)
      ])));
}

Widget thumbsTextButton(
    {required String icon, required String text, Color color = Colors.white}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 14.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "${iconDir}survey/ic_thumb_${icon}_16.svg",
          color: color,
        ),
        SizedBox(
          width: 4.w,
        ),
        Text(
          text,
          style: AppTextStyles.S1SemiBold15.copyWith(color: color),
        )
      ],
    ),
  );
}
