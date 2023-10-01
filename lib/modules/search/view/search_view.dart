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

class SearchScreen extends GetView<SearchViewController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchViewController());
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: ListView(
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
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: AppColors.searchBackground,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  keyboardType: TextInputType.text,
                  cursorColor: AppColors.black,
                  cursorHeight: 18.h,
                  style: AppTextStyles.body2Regular13.copyWith(
                    color: AppColors.grey8,
                    height: 1.5,
                  ),
                  placeholder: "고유 이름을 입력해보세요.",
                  placeholderStyle: AppTextStyles.body2Regular13
                      .copyWith(color: AppColors.grey4, height: 1.5),
                  prefixMode: OverlayVisibilityMode.notEditing,
                  prefix: Padding(
                      padding: EdgeInsets.only(left: 14.w),
                      child: SvgPicture.asset(iconDir + "ic_search_16.svg")),
                  // clearButtonMode: OverlayVisibilityMode.editing,
                  suffixMode: OverlayVisibilityMode.editing,
                  suffix: Padding(
                      padding: EdgeInsets.only(right: 14.w),
                      child: SvgPicture.asset(
                          iconDir + "ic_search_cancel_22.svg")),
                  onSubmitted: ((value) async {
                    //TODO: api 연결
                  }),
                  onChanged: ((value) async {
                    //TODO:연관검색어 widget visible
                    controller.isEditStart.value = true;
                  }),
                  onTap: () {},
                ),
              )
            ],
          ),
          //1. 입력안했을때 최근검색어 리스트
          controller.isEditStart.value
              ? Padding(
                  padding: EdgeInsets.only(top: 32.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "최근 검색 고유이름",
                        style: AppTextStyles.subtitle1Bold15,
                      ),
                      GestureDetector(
                        onTap: () {
                          //TODO: 최근 검색어 모두 삭제
                        },
                        child: Text(
                          "모두 삭제",
                          style: AppTextStyles.body3Bold12
                              .copyWith(color: AppColors.grey6),
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  height: 20.h,
                ),
          //1-1 최근검색어 리스트
          //TODO: 최근검색어 삭제 분기처리
          controller.recentSearchList.isNotEmpty
              ? ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    final recentSearch = controller.recentSearchList[index];
                    return RecentItem(
                      name: recentSearch.name,
                      title: recentSearch.title,
                    );
                  }),
                  separatorBuilder: ((context, index) {
                    return SizedBox(
                      height: 12.h,
                    );
                  }),
                  itemCount: controller.recentSearchList.length)
              : Text(
                  "최근 검색어가 없습니다.",
                  style: AppTextStyles.heading2Bold18,
                ),
        ],
      ),
    ));
  }

  Widget RecentItem({required String name, required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: AppTextStyles.subtitle3Bold13
              .copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          title,
          style: AppTextStyles.body3Bold12
              .copyWith(fontWeight: FontWeight.w500, color: AppColors.grey6),
        ),
      ],
    );
  }
}
