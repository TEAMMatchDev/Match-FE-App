import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:match/modules/home/view/today_match_view.dart';
import 'package:match/provider/routes/routes.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../buring_match/controller/burning_match_controller.dart';
import '../controller/home_controller.dart';
import '../widget/home_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h)
                .copyWith(bottom: 0.h),
            child: Column(
              children: [
                //*1.제목 header
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
                  height: 16.h,
                ),
                //*2. 광고 section
                SizedBox(
                  width: 300.w,
                  height: 60.h,
                  child: CarouselSlider.builder(
                    itemCount: controller.adCount.value,
                    options: CarouselOptions(
                        autoPlay: true, viewportFraction: 300.w / 50.h),
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                          width: 300.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            //radius 수정
                            borderRadius: BorderRadius.circular(5.r),
                            image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: NetworkImage(tmpBackgroundImg),
                                colorFilter: ColorFilter.mode(
                                    //TODO: gradient 적용 detail 수정
                                    Colors.black.withOpacity(0.1),
                                    BlendMode.darken)),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                  bottom: 6.h,
                                  right: 11.w,
                                  child: adIndexItem(
                                      total: controller.adCount.value,
                                      currentIdx: index + 1))
                            ],
                          ));
                    },
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
              ],
            ),
          ),
          //구분선
          Container(
            color: AppColors.searchBackground,
            height: 10.h,
          ),
          //*3. 타오르는 불꽃이 section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                //*제목
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 11.h, bottom: 15.h),
                  child: Text(
                      //TODO: username 적용
                      "박정은님의 타오르는 불꽃이",
                      style: AppTextStyles.T1Bold20),
                ),
                //*불꽃이 ListView
                SizedBox(
                  height: 320.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      // final project = controller.projectList[index];
                      return HomeFlame(
                          flameName: "순두부찌개 먹은 불꽃이",
                          flameImg: tmpBackgroundImg,
                          flameTalk: "말을 겁니다 후원집행시, 생성시, ",
                          usages: "T.B.T 레스큐");
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 20.w,
                      );
                    },
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
