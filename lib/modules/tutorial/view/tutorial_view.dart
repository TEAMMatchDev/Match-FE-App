import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/model/enum/project_type.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../provider/service/auth_service.dart';
import '../../../util/components/global_button.dart';
import '../../../util/const/global_variable.dart';
import '../controller/tutorial_controller.dart';
import '../widget/tutorial_widget.dart';

class TutorialScreen extends GetView<TutorialController> {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //TODO: add click event
                            categoryType(
                              type: ProjectType.ELDER,
                              isSelect:
                                  (controller.selectTypeIdx.value == 0).obs,
                            ),
                            SizedBox(
                              width: 36.w,
                            ),
                            categoryType(
                              type: ProjectType.ANIMAL,
                              isSelect:
                                  (controller.selectTypeIdx.value == 1).obs,
                            ),
                            SizedBox(
                              width: 36.w,
                            ),
                            categoryType(
                              type: ProjectType.CHILDREN,
                              isSelect:
                                  (controller.selectTypeIdx.value == 2).obs,
                            ),
                          ],
                        ),
                      ),
                      controller.selectTypeIdx.value == -1
                          ? Padding(
                              padding: EdgeInsets.only(top: 60.h),
                              child: Text(
                                "${AuthService.to.myProfile.value.name}님, 첫 기부금 1원을 \n어디에 기부할까요?",
                                style: AppTextStyles.S1SemiBold14.copyWith(
                                    fontSize: 20.sp),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: Stack(
                                children: [
                                  SvgPicture.asset(
                                      "${iconDir}ic_speech_${controller.selectTypeIdx.value}_248.svg"),
                                  Positioned(
                                    top: 10.h,
                                    child: Text(
                                      projectTypDescription[
                                              ProjectType.ELDER] ??
                                          "",
                                      style: AppTextStyles.L1Medium13,
                                    ),
                                  )
                                ],
                              ),
                            )
                    ],
                  ),
                ),
              ),
            ),
            CommonButton.edit(
              isActive: controller.selectTypeIdx.value != -1,
                text: "기부 분야 선택 완료",
                onTap: () async {
                  //TODO: api 연결여부 확인 필요
                }),
            SizedBox(
              height: 24.h,
            )
          ],
        ),
      ),
    );
  }
}
