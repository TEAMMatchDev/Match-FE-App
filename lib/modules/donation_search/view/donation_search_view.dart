import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../model/enum/search_status.dart';
import '../../../provider/api/util/global_api_field.dart';
import '../../../util/components/gloabl_text_field.dart';
import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';
import '../../donate/widget/donate_widget.dart';
import '../controller/donation_search_controller.dart';

///<h2>기부처 탐색에서 검색 상세페이지</h2>
///추후에 고유이름 검색화면이 추가될 예정이여 네이밍을 구체화하여 작성
class DonationSearchScreen extends GetView<DonationSearchController> {
  const DonationSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///1. 뒤로가기 아이콘 + 검색 필드
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h)
                  .copyWith(bottom: 0),
              child: CommonTextField(
                  textController: controller.searchTextController.value,
                  placeHolder: "후원명, 후원사, 후원분야 검색",
                  textStatus: controller.searchStatus,
                  suffixOnTap: () async {},
                  onSubmitted: (value) async {
                    await controller.getSearchList(content: value);
                  },
                  onChanged: (value) async {}),
            ),
            SizedBox(
              height: 24.h,
            ),
            // 검색 field 바로 밑에 제목
            ///textfield에 입력값이 없을 때 최근검색어 리스트
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //1~5, 6~10위를 recentSearchList 위젯으로 묶어서 구현
                                  recentSearchList(
                                      startIdx: 1,
                                      keywords: controller.recommendSearchList
                                          .sublist(0, 5)),
                                  recentSearchList(
                                      startIdx: 6,
                                      keywords: controller.recommendSearchList
                                          .sublist(5, 10)),
                                ],
                              ),
                            ],
                          )),
                    ],
                  )

                /// 검색결과가 나올때(검색 api를 호출한 뒤에)
                : controller.searchStatus.value == SEARCH_STATUS.SEARCH
                    ? Padding(
                        padding: EdgeInsets.only(left: 33.w),
                        child: Text(
                          "총 ${controller.totalSearchLength.value}개의 검색결과",
                          style: AppTextStyles.T1Bold13.copyWith(
                              color: AppColors.grey5,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    : const SizedBox.shrink(),
            SizedBox(
              height: 20.h,
            ),

            ///* 2.검색 결과
            Expanded(
              child: controller.searchStatus.value == SEARCH_STATUS.SEARCH
                  ? controller.projectList.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.projectList.length,
                          itemBuilder: (context, index) {
                            //검색 결과 리스트 스크롤시 pagination
                            if (index % (PAGINATION_SIZE - 1) == 0 &&
                                index != 0) {
                              Future.wait({
                                controller.getMoreSearchList(
                                    content: controller
                                        .searchTextController.value.text,
                                    index: index ~/ (PAGINATION_SIZE - 1))
                              });
                            }
                            final project = controller.projectList[index];
                            return Container(
                                padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 8.h)
                                    .copyWith(top: 0),
                                margin: EdgeInsets.only(
                                    bottom: index ==
                                            controller.projectList.length - 1
                                        ? 14.h
                                        : 0.h),
                                child: ProjectWidget(project: project));
                          },
                        )
                      : Center(child: emptyWidget())
                  : const SizedBox.shrink(),
            )
          ],
        ),
      ),
    ));
  }

  ///<h2>최근 검색어 리스트 위젯</h2>
  Widget recentSearchList(
      {required int startIdx, required List<String> keywords}) {
    return Wrap(
        direction: Axis.vertical,
        spacing: 12.h,
        children: List.generate(5, (index) {
          return _recentSearchItem(
              priority: startIdx + index, keyword: keywords[index]);
        }));
  }

  ///<h2>최근 검색어 순위 + 텍스트</h2>
  Widget _recentSearchItem({required int priority, required String keyword}) {
    return GestureDetector(
      onTap: () async {
        //클릭했을때 textfield에 해당 검색어가 입력되고, api도 호출
        controller.searchTextController.value.text = keyword;
        await controller.getSearchList(content: keyword);
      },
      child: SizedBox(
        width: 120.w,
        child: Row(children: [
          Text(
            "$priority",
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
