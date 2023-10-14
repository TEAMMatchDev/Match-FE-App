import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../util/const/global_variable.dart';
import '../../../util/const/style/global_color.dart';
import '../controller/mypage_controller.dart';

class MypageScreen extends GetView<MypageController> {
  const MypageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "내 정보",
                        style: AppTextStyles.T1Bold16,
                      ),
                      SvgPicture.asset(iconDir + "ic_alarm_20.svg")
                    ]),
                SizedBox(
                  height: 25.h,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    "박레이님",
                    style: AppTextStyles.T1Bold18,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey6),
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    child: Text("회원 정보 수정",
                        style: AppTextStyles.L1Medium10.copyWith(
                          color: AppColors.grey6,
                        )),
                  )
                ]),
                SizedBox(
                  height: 9.h,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SvgPicture.asset(iconDir + "ic_kakao_19.svg"),
                  Text("abcdefg@abcdefg",
                      style: AppTextStyles.S1SemiBold14.copyWith(
                        color: AppColors.grey6,
                      ))
                ]),
              ],
            ),
          ),
          Container(
            color: AppColors.searchBackground,
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
