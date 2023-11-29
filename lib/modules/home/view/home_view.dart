import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/provider/service/auth_service.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import '../../../provider/api/util/global_api_field.dart';
import '../../../provider/api/util/pagination_function.dart';
import '../../../util/components/global_widget.dart';
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
                        child: Row(
                          children: [
                            Container(
                              constraints: BoxConstraints(maxWidth: 110.w),
                              child: Text(
                                  AuthService.to.nickName.value,
                                  style: AppTextStyles.T1Bold20,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Text("님의 타오르는 불꽃이", style: AppTextStyles.T1Bold20),
                          ],
                        ),
                      ),
                      //총 불꽃이 1개일때는 개수를 나타내지 않는다
                      controller.totalCnt.value >= 1
                          ? Text(
                              "${controller.currentIdx.value} / ${controller.totalCnt.value}",
                              style: AppTextStyles.T1Bold20)
                          : const SizedBox.shrink(),
                    ],
                  ),

                  ///*불꽃이 ListView
                  ///FlameWidget 내부에 Burning widget routing 포함
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

                              getMoreData(
                                  index: index,
                                  totalCnt: controller.flameList.length,
                                  getMore: controller.getMoreFlame);

                              final flame = controller.flameList[index];
                              return Column(
                                children: [
                                  FlameWidget(
                                    flameName: flame.inherenceName,
                                    flameImg: flame.image,
                                    flameTalk: flame.randomMessage,
                                    usages: flame.usages,
                                    id: flame.donationId,
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  shareChip(
                                      imgUrl: flame.image,
                                      projectId: flame.projectId)
                                ],
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

//TODO: kakao -> app routing 테스트 이전
  Widget shareChip({required String imgUrl, required int projectId}) {
    return GestureDetector(
      onTap: () async {
        await controller.kakoShare(imgUrl: imgUrl, projectId: projectId);
      },
      child: IntrinsicWidth(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 5.h),
          decoration: BoxDecoration(
              color: AppColors.grey0,
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(color: AppColors.grey1)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("${iconDir}ic_share_16_fill.svg"),
              SizedBox(
                width: 4.w,
              ),
              Text(
                "공유하기",
                style:
                    AppTextStyles.L1Medium12.copyWith(color: AppColors.grey5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
