import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/modules/donate/widget/donate_widget.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../model/enum/project_type.dart';
import '../../../util/const/global_variable.dart';
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
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "후원",
                        style: AppTextStyles.T1Bold16,
                      ),
                    ),
                    SvgPicture.asset(iconDir + "ic_search_16.svg"),
                    SizedBox(
                      width: 14.w,
                    ),
                    SvgPicture.asset(iconDir + "ic_alarm_20.svg")
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
                    return GestureDetector(
                      onTap: () {
                        controller.selectIdx.value = index;
                      },
                      child: index == 0
                          ? CircleType(
                              isSelect: controller.selectIdx.value == index,
                              isAll: true,
                            )
                          : CircleType(
                              isSelect: controller.selectIdx.value == index,
                              type: ProjectType.values[index - 1],
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
              //obx 에러 임시처리
              Text(controller.selectIdx.value.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
