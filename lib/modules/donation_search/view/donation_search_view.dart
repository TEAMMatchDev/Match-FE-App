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
import '../../../util/components/gloabl_text_field.dart';
import '../../../util/const/global_variable.dart';
import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';
import '../controller/donation_search_controller.dart';

class DonationSearchScreen extends GetView<DonationSearchController> {
  const DonationSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DonationSearchController());
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Obx(
        () => ListView(
          shrinkWrap: true,
          children: [
            //1. 뒤로가기 아이콘 + 검색 필드
            CommonTextField(
                textController: controller.searchTextController.value,
                placeHolder: "후원명, 후원사, 후원분야 검색",
                textStatus: controller.searchStatus,
                onSubmitted: (value) async {},
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
                        "최근 검색어",
                        style: AppTextStyles.T1Bold15,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await GetStorageUtil.delAllSearch(
                              StorageKey.PROJECT_SEARCH);
                          controller.recentSearchList.value =
                              await GetStorageUtil.getRecentSearches(
                                  StorageKey.PROJECT_SEARCH);
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
                        "총 개의 검색결과",
                        style: AppTextStyles.T1Bold13.copyWith(
                            color: AppColors.grey5,
                            fontWeight: FontWeight.w600),
                      )
                    : SizedBox.shrink(),
            SizedBox(
              height: 20.h,
            ),
            // 검색 field 밑의 contents
          ],
        ),
      ),
    ));
  }
}
