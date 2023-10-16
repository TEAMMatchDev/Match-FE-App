import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:match/modules/donate/widget/donate_widget.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../model/enum/project_type.dart';
import '../../../provider/routes/routes.dart';
import '../../../util/const/global_variable.dart';
import '../../../util/const/style/global_color.dart';
import '../controller/donate_controller.dart';

class DonateScreen extends GetView<DonateController> {
  const DonateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Obx(
          () => Column(
            children: [
              //*1.제목 header
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 8.h).copyWith(bottom: 25.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "후원",
                        style: AppTextStyles.T1Bold16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await Get.toNamed(Routes.donation_search);
                      },
                      child: SvgPicture.asset(
                        iconDir + "ic_search_16.svg",
                        color: AppColors.grey9,
                        height: 20.h,
                      ),
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    SvgPicture.asset(
                      iconDir + "ic_alarm_20.svg",
                      height: 20.h,
                    )
                  ],
                ),
              ),
              //*2.프로젝트 카테고리
              SizedBox(
                height: 76.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: ProjectType.values.length + 1,
                  itemBuilder: ((context, index) {
                    //obx 작동 오류로 한번더 감싸줌
                    return Obx(
                      () => GestureDetector(
                        onTap: () {
                          controller.selectIdx.value = index;
                          //TODO: api 호출
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
                  separatorBuilder: ((context, index) {
                    return SizedBox(
                      width: 16.w,
                    );
                  }),
                ),
              ),
              //*3.정렬기준
              Padding(
                padding: EdgeInsets.only(top: 26.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.isRecent.value = !controller.isRecent.value;
                      },
                      child: Text("• 추천순",
                          style: AppTextStyles.T1Bold12.copyWith(
                            color: !controller.isRecent.value
                                ? AppColors.grey9
                                : AppColors.grey3,
                          )),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.isRecent.value = !controller.isRecent.value;
                      },
                      //위젯화하여 중복코드 제거
                      child: Text("• 최신순",
                          style: AppTextStyles.T1Bold12.copyWith(
                            color: controller.isRecent.value
                                ? AppColors.grey9
                                : AppColors.grey3,
                          )),
                    )
                  ],
                ),
              ),
              //*4.프로젝트 리스트
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(height: 14.h),
                  itemCount: controller.projectList.length,
                  itemBuilder: (context, index) {
                    final project = controller.projectList[index];
                    return Container(
                        margin: EdgeInsets.only(
                            top: index == 0 ? 14.h : 0.h,
                            bottom: index == controller.projectList.length - 1
                                ? 14.h
                                : 0.h),
                        child: ProjectWidget(project: project));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
