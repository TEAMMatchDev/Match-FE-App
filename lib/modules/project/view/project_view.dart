import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:match/model/enum/regular_status.dart';
import 'package:match/modules/project/widget/project_widget.dart';

import '../../../model/enum/search_statu.dart';
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
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                leading: Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: SvgPicture.asset(
                    iconDir + "ic_arrow_left_24.svg",
                  ),
                ),
                leadingWidth: 44.w,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                //*Sliver Attributes
                expandedHeight: 400.h,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.none,
                  centerTitle: true,
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: SvgPicture.asset(
                            iconDir + "ic_arrow_left_24.svg",
                            width: 24.w,
                          )),
                      Text(
                        controller.projectDetail.value.title,
                        style:
                            AppTextStyles.L1Medium14.copyWith(fontSize: 14.sp),
                      ),
                    ],
                  ),
                  background: Container(
                    height: 300.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h)
                            .copyWith(top: 36.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            tmpBackgroundImg2,
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
                                //TODO: 서버에서 보내주는 만큼 표시해야하는지 3개만 표시하는지 확인필요
                                children: controller
                                    .projectDetail.value.userProfileImages
                                    .map((e) => profileItem(size: 40))
                                    .toList(),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                //TODO: 서버 api field 추가 필요
                                "외 ${controller.projectDetail.value.totalDonationCnt - 3}마리의 불꽃이 함께하고 있어요",
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
                    onTap: (index) {
                      controller.tabIndex.value = index;
                    },
                    isScrollable: true,
                    indicatorColor: AppColors.grey9,
                    unselectedLabelColor: AppColors.grey2,
                    labelColor: AppColors.grey9,
                    labelStyle: AppTextStyles.L1Medium14,
                    unselectedLabelStyle: AppTextStyles.L1Medium14.copyWith(
                      color: AppColors.grey7,
                    ),
                    tabs: [
                      // Tab(text: "매칭 정보"), Tab(text: "매칭 기록"),
                      tabWidget("기부처 이야기", 0),
                      tabWidget("불꽃이 기록", 1),
                    ],
                  ),
                ),
                pinned: true,
              )
            ];
          },
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 31.h),
            child: [
              //TODO sequence 반영
              //1. 매칭 정보
              Wrap(
                  children: controller.projectDetail.value.projectImgList
                      .map((e) => Image.network(e.imgUrl))
                      .toList()),
              //2. 매치 기록
              Wrap(
                children: controller.tmpProjectHistories
                    .map(
                      (history) => ProjectComment(
                        profileUrl: history.profileImageUrl,
                        profile: history.nickname,
                        comment: history.histories,
                        timeStamp: history.historyDate,
                      ),
                    )
                    .toList(),
              ),
            ][controller.tabIndex.value],
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
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
