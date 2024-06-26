import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/modules/donate/widget/donate_widget.dart';
import 'package:match/provider/api/util/pagination_function.dart';
import 'package:match/util/components/global_widget.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import '../../../model/enum/project_type.dart';
import '../../../provider/api/project_api.dart';
import '../../../provider/api/util/global_api_field.dart';
import '../../../provider/routes/routes.dart';
import '../../../util/const/global_variable.dart';
import '../../../util/const/style/global_color.dart';
import '../controller/donate_controller.dart';

///<h2>기부처 탐색 화면</h2>
///* 검색 탭을 눌렀을때 나오는 화면
class DonateScreen extends GetView<DonateController> {
  const DonateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Obx(
          () => SafeArea(
            child: Column(
              children: [
                ///*1.제목 header
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h)
                      .copyWith(bottom: 25.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "기부처 탐색",
                          style: AppTextStyles.T1Bold16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await Get.toNamed(Routes.donation_search);
                        },
                        child: SvgPicture.asset(
                          "${iconDir}ic_search_16.svg",
                          color: AppColors.grey9,
                          height: 20.w,
                        ),
                      ),
                      SizedBox(
                        width: 14.w,
                      ),
                      alarmButton()
                    ],
                  ),
                ),

                ///*2.프로젝트 카테고리
                SizedBox(
                  height : 80.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: ProjectType.values.length + 1,
                    separatorBuilder: ((context, index) {
                      return SizedBox(
                        width: 16.w,
                      );
                    }),
                    itemBuilder: ((context, index) {
                      //obx 작동 오류로 한번더 감싸줌
                      return Obx(
                        () => GestureDetector(
                          onTap: () async {
                            controller.selectIdx.value = index;
                            index != 0
                                ? controller.projectList.assignAll(
                                    await ProjectApi.getProjectList(
                                        type: ProjectType.values[index - 1]))
                                : controller.projectList.assignAll(
                                    await ProjectApi.getProjectList());
                          },
                          child: index == 0
                              ? CircleType(
                                  isSelect:
                                      (controller.selectIdx.value == index).obs,
                                  isAll: true,
                                )
                              : CircleType(
                                  isSelect:
                                      (controller.selectIdx.value == index).obs,
                                  type: ProjectType.values[index - 1],
                                ),
                        ),
                      );
                    }),
                  ),
                ),

                ///*3.프로젝트 리스트
                Expanded(
                  child: controller.projectList.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.projectList.length,
                          itemBuilder: (context, index) {
                            getMoreData(
                                index: index,
                                totalCnt: controller.projectList.length,
                                getMore: controller.getMoreProject);

                            final project = controller.projectList[index];
                            return Container(
                                padding: EdgeInsets.symmetric(vertical: 8.h),
                                margin: EdgeInsets.only(
                                    //상단,하단 margin 예외 처리
                                    top: index == 0 ? 14.h : 0.h,
                                    bottom: index ==
                                            controller.projectList.length - 1
                                        ? 14.h
                                        : 0.h),
                                child: ProjectWidget(project: project));
                          },
                        )
                      : emptyWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
