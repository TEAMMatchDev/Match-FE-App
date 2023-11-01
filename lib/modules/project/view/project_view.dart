import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:match/model/enum/regular_status.dart';
import 'package:match/modules/payment/controller/payment_controller.dart';
import 'package:match/modules/payment/view/payment_donator_info_view.dart';
import 'package:match/modules/project/binding/project_binding.dart';
import 'package:match/modules/project/widget/project_widget.dart';
import 'package:match/provider/api/project_api.dart';
import 'package:match/util/const/style/global_logger.dart';

import '../../../model/enum/search_status.dart';
import '../../../provider/api/util/global_api_field.dart';
import '../../../util/components/global_button.dart';
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
      body: Obx(
        () => NestedScrollView(
          controller: controller.scrollController.value,
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            logger.d(innerBoxIsScrolled);
            return <Widget>[
              SliverAppBar(
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: SvgPicture.asset(
                      iconDir + "ic_arrow_left_24.svg",
                    ),
                  ),
                ),
                onStretchTrigger: () async {
                  controller.isStretched.value = false;
                },
                title: !controller.isStretched.value
                    ? Text(
                        controller.projectDetail.value.title,
                        style:
                            AppTextStyles.L1Medium14.copyWith(fontSize: 14.sp),
                      )
                    : null,
                leadingWidth: 44.w,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                elevation: 0.0,
                //*Sliver Attributes
                expandedHeight: 390.h,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  stretchModes: [
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                    StretchMode.fadeTitle,
                  ],
                  background: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h)
                            .copyWith(top: 36.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            controller.projectDetail.value.thumbNail,
                            fit: BoxFit.fitWidth,
                            width: MediaQuery.of(context).size.width,
                            height: 180.h,
                          ),
                          SizedBox(
                            height: 21.h,
                          ),
                          TypeChip(
                              type: regularStatusMap[
                                          controller.projectDetail.value.kind]
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
                            height: 5.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Wrap(
                                spacing: -10.w,
                                children: controller
                                    .projectDetail.value.userProfileImages
                                    .map((e) => profileItem(size: 40))
                                    .toList(),
                              ),
                              controller.projectDetail.value.totalDonationCnt >
                                      0
                                  ? SizedBox(
                                      width: 8.w,
                                    )
                                  : SizedBox.shrink(),
                              Text(
                                controller.projectDetail.value
                                            .totalDonationCnt >
                                        0
                                    ? "외 ${controller.projectDetail.value.totalDonationCnt >= 3 ? controller.projectDetail.value.totalDonationCnt - 3 : controller.projectDetail.value.totalDonationCnt}마리의 불꽃이 함께하고 있어요"
                                    : "아직 후원하는 사람이 없어요",
                                style: AppTextStyles.L1Medium13,
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    controller: controller.matchTabBar.controller,
                    onTap: (index) async{
                      controller.tabIndex.value = index;
                      if(index ==1 && controller.projectHistories.isEmpty){
                        await controller.getProjectHistory();
                      }
                    },
                    labelColor: AppColors.grey9,
                    labelStyle: AppTextStyles.L1Medium14,
                    unselectedLabelColor: AppColors.grey4,
                    indicatorColor: AppColors.grey9,
                    tabs: [
                      Tab(
                        text: "기부처 이야기",
                      ),
                      Tab(text: "불꽃이 기록"),
                    ],
                  ),
                ),
                pinned: true,
              )
            ];
          },
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  controller: controller.matchTabBar.controller,
                  children: [
                    // 첫 번째 탭 (기부처 이야기)
                    ListView.separated(
                      // controller: controller.scrollController.value,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.projectDetail.value.projectImgList.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10.0);
                      },
                      itemBuilder: (context, index) {
                        final imageUrl = controller.projectDetail.value.projectImgList[index].imgUrl;
                        return Image.network(imageUrl);
                      },
                    ),
                    // 두 번째 탭 (불꽃이 기록)
                    ListView.separated(
                      controller: controller.scrollController.value,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.projectHistories.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10.0);
                      },
                      itemBuilder: (context, index) {
                        final history = controller.projectHistories[index];
                        return Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.w),
                          child: ProjectComment(
                            profileUrl: history.profileImageUrl,
                            profile: history.nickname,
                            comment: history.histories,
                            timeStamp: history.historyDate,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 28.h, top: 9.h), // 하단 padding 추가
                  child: CommonButton.login(
                    text: "기부하기",
                    onTap: () async {

                      Get.to(PaymentDonatorScreen());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabWidget(String text, int index) {
    return Obx(() => Container(
          padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 35.w),
          child: Text(
            text,
            style: AppTextStyles.T1Bold14.copyWith(
              color: controller.tabIndex.value == index
                  ? AppColors.grey9
                  : AppColors.grey2,
            ),
          ),
        ));
  }

}

//*SliverDelegate
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
