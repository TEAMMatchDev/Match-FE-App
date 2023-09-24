import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            //1.제목 header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  imgDir + "logo/iv_home_logo.png",
                  width: 75.w,
                ),
                SvgPicture.asset(iconDir + "ic_alarm_20.svg")
              ],
            ),
            SizedBox(
              height: 27.h,
            ),
            //2. 검색 section
            GestureDetector(
              onTap: () {
                //TODO: move search View
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
                decoration: BoxDecoration(
                  color: AppColors.searchBackground,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(iconDir + "ic_search_16.svg"),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      "고유 이름을 입력해보세요.",
                      style: AppTextStyles.body2Regular
                          .copyWith(color: AppColors.grey4),
                    ),
                  ],
                ),
              ),
            ),
            //3. 광고 section
            //4. 자신의 매치 section
            //5. 매치 추천 section
            //6. 기부처 추천 section
          ],
        ),
      ),
    );
  }
}
