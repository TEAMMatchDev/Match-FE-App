import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:match/modules/survey/widget/survey_widget.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../util/components/gloabl_text_field.dart';
import '../../../util/components/global_button.dart';
import '../../../util/components/global_widget.dart';
import '../controller/survey_controller.dart';
import 'survey_complete_view.dart';

class SurveyScreen extends GetView<SurveyController> {
  const SurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.closeIcon("MATCH 리뷰"),
      body:

          ///* 입력 내용이 많아졌을때 overFlow 에러를 방지하기위해 listview로 설정
          Obx(
        () => Stack(
          children: [
            ListView(
              scrollDirection: Axis.vertical,
              controller: controller.scrollController.value,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        "솔직한 리뷰를 남겨주세요",
                        style: AppTextStyles.T1Bold16,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: Column(
                          children: [
                            RateWidget(
                                title: "후원 경험",
                                subtitle: "정기적으로 후원할 수 있는 환경이 제공되었나요?",
                                rate: controller.donateRate),
                            SizedBox(
                              height: 10.h,
                            ),
                            RateWidget(
                                title: "투명성",
                                subtitle: "후원 단체에 대한 신뢰가 형성되었나요?",
                                rate: controller.truthRate),
                            SizedBox(
                              height: 10.h,
                            ),
                            RateWidget(
                                title: "정보 제공",
                                subtitle: "후원 과정에서 충분한 안내를 받았나요?",
                                rate: controller.informRate),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GreySizedBox(),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "MATCH와 함께 한 후원은 어떠셨나요?",
                          style: AppTextStyles.T1Bold16,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          height: 100.h,
                          child: CommonInputField.survey(
                            textController:
                                controller.commentTextController.value,
                            onChange: (value) async {
                              if (value.length >= 1000) {
                                Fluttertoast.showToast(
                                    msg: "리뷰 내용은 최대 1,000자까지 작성 가능해요.");
                                // 1000번째 인덱스 이후의 값 삭제
                                value.substring(0, 1000);
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                      ]),
                ),
              ],
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 29.w, vertical: 20.h),
                  child: CommonButton.edit(
                    text: "작성 완료",
                    isActive: true,
                    onTap: () async {
                      //TODO: 리뷰 등록 api
                      Get.to(() => const SurveyCompleteScreen());
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
