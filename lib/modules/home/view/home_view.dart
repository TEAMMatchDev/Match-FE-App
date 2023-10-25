import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../provider/api/flame_api.dart';
import '../../../provider/api/util/global_api_field.dart';
import '../../../util/components/global_widget.dart';
import '../../../util/const/style/global_logger.dart';
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
                    width: 320.w,
                    height: 60.h,
                    child: CarouselSlider.builder(
                      itemCount: controller.adCount.value,
                      options: CarouselOptions(
                          autoPlay: true, viewportFraction: 300.w / 50.h),
                      itemBuilder: (context, index, realIndex) {
                        return BannerWidget(
                          totalItem: controller.adCount.value,
                          currentIdx: index + 1,
                          banner:controller.bannerList[index],
                        );
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 11.h, bottom: 15.h),
                        child: Text(
                            //TODO: username 적용
                            "박정은님의 타오르는 불꽃이",
                            style: AppTextStyles.T1Bold20),
                      ),
                      Text(
                            "${controller.currentIdx.value} / ${controller.totalCnt.value}",
                            style: AppTextStyles.T1Bold20),
                    ],
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
                        logger.d(index);
                        //builder 안에서 상태값을 바꿔주기때문에 build이후에 추가하는 로직 추가
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          controller.currentIdx.value = index + 1;
                        });
                        if (index % (PAGINATION_SIZE - 1) == 0 && index != 0) {
                          logger.d("1. getMoreFlame 호출!");
                          Future.wait({
                            controller
                                .getMoreFlame(index ~/ (PAGINATION_SIZE - 1))
                          });
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
