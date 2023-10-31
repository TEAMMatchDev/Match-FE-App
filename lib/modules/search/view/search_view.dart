import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/util/method/get_storage.dart';

import '../../../model/enum/search_status.dart';
import '../../../model/recent_search/recent_search.dart';
import '../../../util/components/gloabl_text_field.dart';
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
        body: SafeArea(
          child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Obx(
          () => ListView(
            shrinkWrap: true,
            children: [
              //1. 뒤로가기 아이콘 + 검색 필드
              CommonTextField(
                  textController: controller.searchTextController.value,
                  placeHolder: "고유 이름을 입력해보세요.",
                  textStatus: controller.searchStatus,
                  suffixOnTap: () async {
                    //저장된 최근검색어가 있을 경우 다시 불러온다
                    controller.recentSearchList.value =
                        await GetStorageUtil.getRecentSearches(
                            StorageKey.NAME_SEARCH);
                  },
                  onSubmitted: (value) async {
                    //TODO: api 연결
                    //검색결과가 없어도 최근검색 결과에 추가
                    await GetStorageUtil.addRecentSearch(
                        StorageKey.NAME_SEARCH,
                        RecentSearch(
                            name: value,
                            title: controller.searchResults[0].projectName,
                            donationId: controller.searchResults[0].donationId));
                  },
                  onChanged: (value) async {}),
              SizedBox(
                height: 30.h,
              ),
              // 검색 field 바로 밑에 제목
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
                          onTap: () async {
                            await GetStorageUtil.delAllSearch(
                                StorageKey.NAME_SEARCH);
                            controller.recentSearchList.value =
                                await GetStorageUtil.getRecentSearches(
                                    StorageKey.NAME_SEARCH);
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
              // 검색 field 밑의 contents
              //1-1 최근검색어 리스트
              ListView.separated(
                shrinkWrap: true,
                itemCount: controller.searchStatus.value != SEARCH_STATUS.SEARCH
                    ? controller.recentSearchList.length
                    : controller.searchResults.length,
                itemBuilder: ((context, index) {
                  //TODO: (기획 확인 필요) SEARCH_STATUS.EDIT중에 최근검색어 / 검색결과 여부
                  switch (controller.searchStatus.value) {
                    case SEARCH_STATUS.SEARCH:
                      final search = controller.searchResults[index];
                      return SearchItem(search: search);
                    default:
                      return RecentItem(
                        recentSearch: controller.recentSearchList[index],
                        onTap: () async {
                          controller.searchTextController.value.text =
                              controller.recentSearchList[index].name;
                          controller.searchStatus.value = SEARCH_STATUS.SEARCH;
                          //TODO api 호출
                        },
                      );
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
              ),
              if (controller.searchStatus.value == SEARCH_STATUS.SEARCH &&
                  controller.searchResults.isEmpty)
                Center(
                  child: Text(
                    "검색 결과가 없습니다",
                    style: AppTextStyles.T1Bold18,
                  ),
                ),
              if (controller.searchStatus.value != SEARCH_STATUS.SEARCH &&
                  controller.recentSearchList.isEmpty)
                Center(
                  child: Text(
                    "최근 검색 결과가 없습니다",
                    style: AppTextStyles.T1Bold18,
                  ),
                ),
            ],
          ),
      ),
    ),
        ));
  }
}
