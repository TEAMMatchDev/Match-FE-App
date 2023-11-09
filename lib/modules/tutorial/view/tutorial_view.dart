import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/model/enum/project_type.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../provider/routes/routes.dart';
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
        child: Obx(
          () => Column(
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
                              for (var i = 0;
                                  i < controller.projectTypes.length;
                                  i++)
                                GestureDetector(
                                  onTap: () {
                                    controller.selectTypeIdx.value = i;
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: i !=
                                                controller.projectTypes.length -
                                                    1
                                            ? 36.w
                                            : 0),
                                    child: categoryType(
                                      type: controller.projectTypes[i],
                                      isSelect:
                                          (controller.selectTypeIdx.value == i)
                                              .obs,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        controller.selectTypeIdx.value == -1
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
                                            "${imgDir}ic_speech_${controller.selectTypeIdx.value}_248.png"),
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
                                              projectTypDescription[
                                                      controller.projectTypes[
                                                          controller
                                                              .selectTypeIdx
                                                              .value]] ??
                                                  "",
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
                ),
              ),
              CommonButton.edit(
                  isActive: controller.selectTypeIdx.value != -1,
                  text: "기부 분야 선택 완료",
                  onTap: () async {
                    //TODO: api 연결여부 확인 필요
                    await Get.toNamed(Routes.main);
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
