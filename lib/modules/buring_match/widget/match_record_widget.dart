import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';
import '../../home/widget/home_widget.dart';

class MatchRecord extends StatelessWidget {
  final bool isFinal;
  final String title;
  final String date;
  final List<String> imgList;
  const MatchRecord(
      {super.key,
      this.isFinal = false,
      required this.title,
      required this.date,
      required this.imgList});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        !isFinal
            ? SizedBox(
                width: 38.w,
                height: imgList.isEmpty ? 66.h : 100.h,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      //TODO: api field 값에 따라 스타일 변경 14/ 3
                      width: 14.h,
                      height: 14.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          //TODO: api field 값에 따라 스타일 변경 primary_500 / grey5
                          color: AppColors.primary500),
                    ),
                    Container(
                        width: 2.w,
                        height: double.infinity,
                        color: AppColors.grey1),
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Container(
                  //TODO: api field 값에 따라 스타일 변경 14/ 3
                  height: 14.h,
                  width: 14.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //TODO: api field 값에 따라 스타일 변경 primary_500 / grey5
                      color: AppColors.primary500),
                ),
              ),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "박레이님의 불꽃이 탄생했습니다",
                style: AppTextStyles.subtitle3Bold13,
              ),
              Text(
                "2021.09.09",
                style: AppTextStyles.body3Bold12.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.grey6),
              ),
              imgList.isNotEmpty
                  ? Wrap(
                      spacing: 10.w,
                      children: imgList
                          .map((e) => Container(
                              height: 60.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(tmpBackgroundImg),
                                ),
                              )))
                          .toList())
                  : const SizedBox.shrink(),
            ]),
      ],
    );
  }
}
