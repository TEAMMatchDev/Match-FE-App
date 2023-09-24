import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
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
          style: AppTextStyles.heading3Bold16,
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

class OrganizationItem extends StatelessWidget {
  final String title;
  final String comment;
  //TODO: imgUrl
  const OrganizationItem(
      {super.key, required this.title, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 99.h,
      width: 220.w,
      padding: EdgeInsets.symmetric(vertical: 26.h, horizontal: 23.w),
      decoration: BoxDecoration(
        //radius 수정
        borderRadius: BorderRadius.circular(10.r),
        image: DecorationImage(
          image: AssetImage(imgDir + "iv_test_ad_320.png"),
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3), BlendMode.srcOver),
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: AppTextStyles.subtitle1Bold15.copyWith(color: AppColors.white),
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          children: [
            SvgPicture.asset("${iconDir}ic_comment_16.svg"),
            SizedBox(
              width: 4.w,
            ),
            Text(
              comment,
              style: AppTextStyles.body3Bold12.copyWith(color: AppColors.white),
            )
          ],
        )
      ]),
    );
  }
}
