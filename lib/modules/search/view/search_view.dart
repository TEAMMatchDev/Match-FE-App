import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../util/const/global_variable.dart';
import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchController());
    return Scaffold(
        body: ListView(
      children: [
        //1. 뒤로가기 아이콘 + 검색 필드
        Row(
          children: [
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(iconDir + "ic_left_arrow_24.svg")),
            SizedBox(
              width: 14.w,
            ),
            Expanded(
              child: CupertinoTextField(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  color: AppColors.searchBackground,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                keyboardType: TextInputType.text,
                style: AppTextStyles.body2Regular13
                    .copyWith(color: AppColors.grey8),
                placeholder: "고유 이름을 입력해보세요.",
                placeholderStyle: AppTextStyles.body2Regular13
                    .copyWith(color: AppColors.grey4),
                prefixMode: OverlayVisibilityMode.editing,
                prefix: Padding(
                    padding: EdgeInsets.only(right: 6.w),
                    child: SvgPicture.asset(iconDir + "ic_search_16.svg")),
                suffixMode: OverlayVisibilityMode.notEditing,
                suffix: Padding(
                    padding: EdgeInsets.only(left: 6.w),
                    child:
                        SvgPicture.asset(iconDir + "ic_search_cancel_22.svg")),
                onSubmitted: ((value) async {
                  //TODO: api 연결
                }),
                onChanged: ((value) async {
                  //TODO: 최근 검색어 widget 삭제 ; 연관검색어 widget visible
                }),
              ),
            )
          ],
        )
      ],
    ));
  }
}
