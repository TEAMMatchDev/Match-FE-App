import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/model/enum/project_type.dart';
import 'package:match/modules/tutorial/view/tutorial_result_view.dart';
import 'package:match/provider/api/tutorial_api.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../provider/routes/routes.dart';
import '../../../provider/service/auth_service.dart';
import '../../../util/components/global_button.dart';
import '../../../util/const/global_mock_data.dart';
import '../../../util/const/global_variable.dart';
import '../../../util/const/style/global_logger.dart';
import '../controller/tutorial_controller.dart';
import '../widget/tutorial_widget.dart';

class TutorialScreen extends GetView<TutorialController> {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.projectTypes.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.selectProject.value =
                                  controller.projectTypes[index];
                              controller.selectTypeIdx.value = index;
                              logger.e(controller.selectProject);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: index !=
                                          controller.projectTypes.length - 1
                                      ? 36.w
                                      : 0),
                              child: categoryType(
                                type: projectTypeMap[controller
                                        .projectTypes[index].projectKind] ??
                                    ProjectType.CHILDREN,
                                isSelect:
                                    (controller.selectTypeIdx.value == index)
                                        .obs,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    controller.selectProject.value == tmpRecommendProject
                        ? Padding(
                            padding: EdgeInsets.only(top: 60.h),
                            child: Text(
                              "${AuthService.to.name.value}님, 첫 기부금 1원을 \n어디에 기부할까요?",
                              style: AppTextStyles.S1SemiBold14.copyWith(
                                  fontSize: 20.sp),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: Container(
                                width: 260.w,
                                height: 45.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "${imgDir}ic_speech_${controller.projectTypes.indexOf(controller.selectProject.value)}_248.png"),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      top: 13.h,
                                      child: SizedBox(
                                        width: 250.w,
                                        height: 30.h,
                                        child: Text(
                                          controller.selectProject.value.randomMessage,
                                          style: AppTextStyles.L1Medium13,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          )
                  ],
                ),
              ),
              CommonButton.edit(
                  isActive: controller.selectProject.value != tmpRecommendProject,
                  text: "기부 분야 선택 완료",
                  onTap: () async {
                    var result = await TutorialApi.setDonationTutorial(
                        projectId: controller.selectProject.value.projectId);
                    if (result != null) {
                      Get.to(() => TutorialResultScreen(
                            tutorialFlame: result,
                          ));
                    } else {
                      Get.offAllNamed(Routes.main);
                    }
                  }),
              SizedBox(
                height: 24.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
