import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/util/method/get_storage.dart';

import '../../../model/enum/search_statu.dart';
import '../../../model/recent_search/recent_search.dart';
import '../../../provider/api/search_api.dart';
import '../../../util/components/gloabl_text_field.dart';
import '../../../util/const/global_variable.dart';
import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';
import '../../donate/widget/donate_widget.dart';
import '../controller/donation_search_controller.dart';

class DonationSearchScreen extends GetView<DonationSearchController> {
  const DonationSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DonationSearchController());
    return Scaffold(
        body: Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //1. 뒤로가기 아이콘 + 검색 필드
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h)
                .copyWith(bottom: 0),
            child: CommonTextField(
                textController: controller.searchTextController.value,
                placeHolder: "후원명, 후원사, 후원분야 검색",
                textStatus: controller.searchStatus,
                suffixOnTap: () async {},
                onSubmitted: (value) async {
                  //TODO: add search api
                  // controller.projectList.addAll(
                  // await SearchApi.getSearchResult(content: value));
                },
                onChanged: (value) async {}),
          ),
          SizedBox(
            height: 24.h,
          ),
          // 검색 field 바로 밑에 제목
          //1. 입력안했을때 최근검색어 리스트
          controller.searchStatus.value == SEARCH_STATUS.INIT
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(
                      thickness: 1,
                      color: AppColors.divider1,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.w, vertical: 14.h),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "추천 검색어",
                                style: AppTextStyles.T1Bold15,
                              ),
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                recentSearchList(startIdx: 1,keywords: controller.recommendSearchList.sublist(0,5)),
                                recentSearchList(startIdx: 6,keywords: controller.recommendSearchList.sublist(5,10)),
                              ],
                            ),
                          ],
                        )),
                  ],
                )
              : controller.searchStatus.value == SEARCH_STATUS.SEARCH
                  ? Padding(
                      padding: EdgeInsets.only(left: 33.w),
                      child: Text(
                        "총 ${controller.projectList.length}개의 검색결과",
                        style: AppTextStyles.T1Bold13.copyWith(
                            color: AppColors.grey5,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  : SizedBox.shrink(),
          SizedBox(
            height: 20.h,
          ),
          // 검색 field 밑의 contents
          //*4.프로젝트 리스트
          controller.searchStatus.value == SEARCH_STATUS.SEARCH
              ? controller.searchStatus.value == SEARCH_STATUS.SEARCH
                  ? Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 14.h),
                        itemCount: controller.projectList.length,
                        itemBuilder: (context, index) {
                          final project = controller.projectList[index];
                          return Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              margin: EdgeInsets.only(
                                  bottom:
                                      index == controller.projectList.length - 1
                                          ? 14.h
                                          : 0.h),
                              child: ProjectWidget(project: project));
                        },
                      ),
                    )
                  : Center(
                      child: Text(
                        "최근 검색 결과가 없습니다",
                        style: AppTextStyles.T1Bold18,
                      ),
                    )
              : SizedBox.shrink(),
        ],
      ),
    ));
  }

  Widget recentSearchList({required int startIdx, required List<String> keywords }) {
    return Wrap(
        direction: Axis.vertical,
        spacing: 12.h,
        children: List.generate(5, (index) {
          return _recentSearchItem(
              priority: startIdx + index,
              //임시 하드코딩
              keyword: keywords[index]);
        }));
  }

  Widget _recentSearchItem({required int priority, required String keyword}) {
    return GestureDetector(
      onTap: (){
        controller.searchTextController.value.text = keyword;
        //TODO: add search api
        controller.searchStatus.value = SEARCH_STATUS.SEARCH;
      },
      child: SizedBox(
        width: 120.w,
        child: Row(children: [
          Text(
            "${priority}",
            style: AppTextStyles.T1Bold13.copyWith(color: AppColors.primary500),
          ),
          SizedBox(
            width: 19.w,
          ),
          Text(
            keyword,
            style: AppTextStyles.S1SemiBold14,
            overflow: TextOverflow.ellipsis,
          ),
        ]),
      ),
    );
  }
}
