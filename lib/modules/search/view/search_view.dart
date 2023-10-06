import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../util/const/global_variable.dart';
import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';
import '../controller/search_controller.dart';
import '../widget/search_widget.dart';

class SearchScreen extends GetView<SearchViewController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchViewController());
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Obx(
        () => ListView(
          shrinkWrap: true,
          children: [
            //1. 뒤로가기 아이콘 + 검색 필드
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      iconDir + "ic_arrow_left_24.svg",
                      width: 24.w,
                    )),
                SizedBox(
                  width: 14.w,
                ),
                Expanded(
                  child: CupertinoTextField(
                    controller: controller.searchTextController.value,
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: AppColors.searchBackground,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    keyboardType: TextInputType.text,
                    cursorColor: AppColors.black,
                    cursorHeight: 18.h,
                    style: AppTextStyles.L1Medium13.copyWith(
                      color: AppColors.grey8,
                      height: 1.5,
                    ),
                    placeholder: "고유 이름을 입력해보세요.",
                    placeholderStyle: AppTextStyles.L1Medium13.copyWith(
                        color: AppColors.grey4, height: 1.5),
                    prefixMode: OverlayVisibilityMode.notEditing,
                    prefix: Padding(
                        padding: EdgeInsets.only(left: 14.w),
                        child: SvgPicture.asset(iconDir + "ic_search_16.svg")),
                    // clearButtonMode: OverlayVisibilityMode.editing,
                    suffixMode: OverlayVisibilityMode.editing,
                    suffix: GestureDetector(
                      onTap: () {
                        controller.searchTextController.value.clear();
                        controller.searchStatus.value = SEARCH_STATUS.INIT;
                      },
                      child: Padding(
                          padding: EdgeInsets.only(right: 14.w),
                          child: SvgPicture.asset(
                              iconDir + "ic_search_cancel_22.svg")),
                    ),
                    //자동 키보드 활성화
                    autofocus: true,
                    onSubmitted: ((value) async {
                      controller.searchStatus.value = SEARCH_STATUS.SEARCH;
                      //TODO: api 연결
                    }),
                    onChanged: ((value) async {
                      controller.searchStatus.value = SEARCH_STATUS.EDIT;
                      //TODO:연관검색어 widget visible
                    }),
                    onTap: () {},
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            //1. 입력안했을때 최근검색어 리스트
            controller.searchStatus.value == SEARCH_STATUS.INIT
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "최근 검색 고유이름",
                        style: AppTextStyles.T1Bold15,
                      ),
                      GestureDetector(
                        onTap: () {
                          //TODO: 최근 검색어 모두 삭제
                        },
                        child: Text(
                          "모두 삭제",
                          style: AppTextStyles.T1Bold12.copyWith(
                              color: AppColors.grey6),
                        ),
                      ),
                    ],
                  )
                : controller.searchStatus.value == SEARCH_STATUS.SEARCH
                    ? Text(
                        "총 ${controller.searchResults.length}개의 검색결과",
                        style: AppTextStyles.T1Bold13.copyWith(
                            color: AppColors.grey5,
                            fontWeight: FontWeight.w600),
                      )
                    : SizedBox.shrink(),
            SizedBox(
              height: 20.h,
            ),
            //1-1 최근검색어 리스트
            //TODO: 최근검색어 삭제 분기처리
            controller.recentSearchList.isNotEmpty
                ? ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      //TODO: (기획 확인 필요) SEARCH_STATUS.EDIT중에 최근검색어 / 검색결과 여부
                      switch (controller.searchStatus.value) {
                        case SEARCH_STATUS.SEARCH:
                          final search = controller.searchResults[index];
                          return SearchItem(
                              imgUrl: search.imgUrl,
                              name: search.title,
                              title: search.usages,
                              projectId: search.projectId);
                        default:
                          return RecentItem(
                              recentSearch: controller.recentSearchList[index]);
                      }
                    }),
                    separatorBuilder: ((context, index) {
                      switch (controller.searchStatus.value) {
                        case SEARCH_STATUS.SEARCH:
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: Divider(
                              thickness: 1,
                              color: AppColors.divider1,
                            ),
                          );
                        default:
                          return SizedBox(
                            height: 12.h,
                          );
                      }
                    }),
                    itemCount: controller.recentSearchList.length)
                : Text(
                    "최근 검색어가 없습니다.",
                    style: AppTextStyles.T1Bold18,
                  ),
          ],
        ),
      ),
    ));
  }
}
