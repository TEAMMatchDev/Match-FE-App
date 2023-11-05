import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/provider/service/auth_service.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import '../../../provider/api/util/global_api_field.dart';
import '../../../util/components/global_widget.dart';
import '../../../util/const/style/global_logger.dart';
import '../../../util/const/style/global_skeleton.dart';
import '../controller/home_controller.dart';
import '../widget/home_widget.dart';

///* <h2> main 홈 진입시 홈 탭에 해당하는 화면 </h2>
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
                  ///*1.제목 header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "${imgDir}logo/iv_home_logo.png",
                        width: 75.w,
                      ),
                      alarmButton()
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),

                  ///*2. 광고 section
                  controller.bannerList.isEmpty
                      ? CommonSkeleton.ad()
                      : SizedBox(
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
                                banner: controller.bannerList[index],
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

            ///*3. 타오르는 불꽃이 section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  ///*제목
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 11.h, bottom: 15.h),
                        child: Text(
                            "${AuthService.to.myProfile.value.nickName}님의 타오르는 불꽃이",
                            style: AppTextStyles.T1Bold20),
                      ),
                      //총 불꽃이 1개일때는 개수를 나타내지 않는다
                      controller.totalCnt.value != 1
                          ? Text(
                              "${controller.currentIdx.value} / ${controller.totalCnt.value}",
                              style: AppTextStyles.T1Bold20)
                          : const SizedBox.shrink(),
                    ],
                  ),

                  ///*불꽃이 ListView
                  controller.flameList.isEmpty
                      ? const FlameWidget()
                      : SizedBox(
                          height: 350.h,
                          child: CarouselSlider.builder(
                            itemCount: controller.flameList.length,
                            options: CarouselOptions(
                                enableInfiniteScroll: false,
                                autoPlay: false,
                                aspectRatio: 270.w / 298.h,
                                viewportFraction: 1),
                            itemBuilder: (context, index, realIndex) {
                              //builder 안에서 상태값을 바꿔주기때문에 build이후에 추가하는 로직 추가
                              //현재 index 표시 text에서 버벅임 현상을 줄이기 위해 해당 scope 추가
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                controller.currentIdx.value = index + 1;
                              });
                              if (index % (PAGINATION_SIZE - 1) == 0 &&
                                  index != 0) {
                                Future.wait({
                                  controller.getMoreFlame(
                                      index ~/ (PAGINATION_SIZE - 1))
                                });
                              }
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
