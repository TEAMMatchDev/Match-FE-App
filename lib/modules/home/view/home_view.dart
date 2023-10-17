import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../provider/api/util/global_api_field.dart';
import '../../../util/components/global_widget.dart';
import '../controller/home_controller.dart';
import '../widget/home_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView(
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
                      alarmButton()
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
                    height: 350.h,
                    child: CarouselSlider.builder(
                      itemCount: controller.flameList.length,
                      options: CarouselOptions(
                          enableInfiniteScroll: false,
                          autoPlay: false,
                          aspectRatio: 255.w / 320.h,
                          viewportFraction: 1),
                      itemBuilder: (context, index, realIndex) {
                        if (index % PAGINATION_SIZE-1 == 0 && index != 0) {
                          controller.getMoreFlame(index);
                        }
                        //TODO: pagination 처리
                        final flame = controller.flameList[index];
                        return FlameWidget(
                          flameName: flame.inherenceName,
                          flameImg: flame.image,
                          flameTalk: flame.randomMessage,
                          usages: flame.usages,
                          id: flame.donationId,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
