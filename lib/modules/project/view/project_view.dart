import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:match/model/enum/regular_status.dart';
import 'package:match/util/components/global_bottomsheet.dart';

import '../../../util/components/global_widget.dart';
import '../../../util/const/global_variable.dart';
import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';
import '../../home/widget/home_widget.dart';
import '../controller/project_controller.dart';

class ProjectScreen extends GetView<ProjectController> {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(children: [
            Image.network(
              tmpBackgroundImg2,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(
                          iconDir + "ic_arrow_left_24.svg",
                          color: AppColors.white,
                          height: 24.h,
                        )),
                    LikeIcon(isLike: controller.isLike)
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 24.h,
                right: 20.w,
                child: GestureDetector(
                    onTap: () async {
                      await Get.bottomSheet(ShareBottomSheet(
                          screenType: "project",
                          imgUrl: controller.projectDetail.value.thumbNail,
                          usages: controller.projectDetail.value.usages,
                          title: controller.projectDetail.value.title,
                          id: controller.projectDetail.value.projectId));
                    },
                    child: SvgPicture.asset(
                      iconDir + "ic_share_16.svg",
                      height: 30.h,
                    ))),
          ]),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h)
                .copyWith(bottom: 32.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TypeChip(
                  type: regularStatusMap[controller.projectDetail.value.kind]
                          ?.stateName ??
                      "동물"),
              SizedBox(
                height: 12.h,
              ),
              Text(
                controller.projectDetail.value.title,
                style: AppTextStyles.T1Bold15,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                controller.projectDetail.value.usages,
                style: AppTextStyles.T1Bold13.copyWith(
                  color: AppColors.grey7,
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Wrap(
                    spacing: -10.w,
                    //TODO: 서버에서 보내주는 만큼 표시해야하는지 3개만 표시하는지 확인필요
                    children: controller.projectDetail.value.userProfileImages
                        .map((e) => profileItem())
                        .toList(),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    //TODO: 서버 api field 추가 필요
                    "외 ${controller.projectDetail.value.totalDonationCnt - 3}명이 후원하고 있어요",
                    style: AppTextStyles.L1Medium13.copyWith(
                      color: AppColors.grey5,
                    ),
                  ),
                ],
              ),
            ]),
          ),
          TabBar(
            controller: controller.matchTabBar.controller,
            onTap: (index) {
              controller.tabIndex.value = index;
            },
            isScrollable: true,
            indicatorColor: AppColors.grey9,
            unselectedLabelColor: AppColors.grey2,
            labelColor: AppColors.grey9,
            indicatorWeight: 2,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: AppTextStyles.L1Medium14,
            unselectedLabelStyle: AppTextStyles.L1Medium14.copyWith(
              color: AppColors.grey7,
            ),
            tabs: [
              tabWidget("매칭 정보", 0),
              tabWidget("매치 기록", 1),
              tabWidget("매치 응원", 2),
            ],
          ),
          [
            //TODO sequence 반영
            Wrap(
                children: controller.projectDetail.value.projectImgList
                    .map((e) => Image.network(e.imgUrl))
                    .toList()),
            //TODO: 임시 레이아웃
            Wrap(
                children: controller.projectDetail.value.projectImgList
                    .map((e) => Image.network(e.imgUrl))
                    .toList()),
            Wrap(
                children: controller.projectDetail.value.projectImgList
                    .map((e) => Image.network(e.imgUrl))
                    .toList())
          ][controller.tabIndex.value],
        ],
      ),
    );
  }

  Widget tabWidget(String text, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 8.w),
      child: Text(
        text,
        style: AppTextStyles.T1Bold14.copyWith(
          color: controller.tabIndex.value == index
              ? AppColors.grey9
              : AppColors.grey2,
        ),
      ),
    );
  }
}
