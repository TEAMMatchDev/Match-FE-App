import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:match/modules/buring_match/controller/burning_match_controller.dart';
import 'package:match/modules/buring_match/widget/burning_match_widget.dart';
import 'package:match/modules/home/widget/home_widget.dart';
import 'package:match/util/components/global_widget.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../util/components/global_app_bar.dart';
import '../../../util/const/global_variable.dart';

class BurningMatchScreen extends GetView<BurningMatchController> {
  const BurningMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.basic("후원타이틀"),
      body: ListView(
        children: [
          //1. 후원타이틀
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "후원 타이틀",
                  style: AppTextStyles.heading2Bold18,
                ),
                TypeChip(type: "매칭 진행 중")
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: AppColors.divider1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Column(
              children: [
                ///5-7-1. 매치 결제 정보
                ///*[BurningMatchCredit]화면에서 사용된 결제내역 위젯 재사용
                MatchPayment(day: 5, price: 3000),

                ///5-7-2. 매치 기록
                ///*이미지 + 공유 버튼
                //TODO: NetworkImage를 활용한 썸네일 위젯 공통위젯으로 분리
                Container(
                  height: 180.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(tmpBackgroundImg),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 14.h,
                          right: 16.w,
                          child: GestureDetector(
                              onTap: () {
                                //TODO: share 기능 구현/ 저장,복사,공유하기 버튼
                              },
                              child: SvgPicture.asset(
                                  iconDir + "ic_share_16.svg"))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
