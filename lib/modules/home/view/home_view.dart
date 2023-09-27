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
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
            child: Column(
              children: [
                Row(
                  //1.제목 header
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
                    padding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
                    decoration: BoxDecoration(
                      color: AppColors.searchBackground,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(iconDir + "ic_search_16.svg"),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          "고유 이름을 입력해보세요.",
                          style: AppTextStyles.body2Regular13
                              .copyWith(color: AppColors.grey4),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                //3. 광고 section
                SizedBox(
                  child: CarouselSlider.builder(
                    itemCount: controller.adCount.value,
                    options: CarouselOptions(
                        autoPlay: true, viewportFraction: 300.w / 136.h),
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                          width: 300.w,
                          decoration: BoxDecoration(
                            //radius 수정
                            borderRadius: BorderRadius.circular(20.r),
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
                                  bottom: 25.h,
                                  right: 16.w,
                                  child: adIndexItem(
                                      total: controller.adCount.value,
                                      currentIdx: index + 1))
                            ],
                          ));
                    },
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                //4. 자신의 매치 section
                //TODO: 매치 내역이 없다면 해당 섹션을 보여주지 않음
                // 제목
                CommonSectionHeader(
                    title: '박정은님의 불타는 매치',
                    destination: () async {
                      await Get.toNamed(Routes.home + Routes.burning_match_pay);
                    }),
                SizedBox(
                  height: 180.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return MyMatchItem(
                          destination: () async {
                            Get.toNamed(Routes.home + Routes.burning_match);
                          },
                          title: "후원 함께할 분, 들어와요!",
                          count: 15,
                          imgList: ["test", "test", "test"]);
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

          Container(
            margin: EdgeInsets.symmetric(vertical: 29.h).copyWith(bottom: 0.h),
            color: AppColors.searchBackground,
            height: 10.h,
          ),
          //5. 매치 추천 section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
            child: Column(
              children: [
                CommonSectionHeader(
                  title: '오늘 이 매치는 어때요?',
                  //TODO : destination 임시 처리
                  destination: () async {
                    Get.to(TodayMatchScreen());
                  },
                ),
                SizedBox(
                  height: 223.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      //TODO: 현재 같은 변수를 사용하여 좋아요가 동기화 됨
                      return TodayMatchItem(
                          title: "후원 함께할분!",
                          organization: "후원처명",
                          count: 14,
                          isLike: controller.isLike);
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

          Container(
            color: AppColors.searchBackground,
            height: 10.h,
          ),
          //6. 기부처 추천 section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
            child: Column(
              children: [
                CommonSectionHeader(
                    title: '박레이님께 꼭 맞는 기부처 추천',
                    //TODO : destination 임시 처리
                    destination: () async {}),
                SizedBox(
                  height: 99.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return OrganizationItem(
                        title: "test",
                        comment: "testest",
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 20.w,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 25.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
