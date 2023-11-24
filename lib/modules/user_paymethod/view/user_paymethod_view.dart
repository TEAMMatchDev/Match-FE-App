import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:match/modules/payment/widget/card_slider_widget.dart';
import 'package:match/modules/user_paymethod/controller/user_paymethod_controller.dart';
import 'package:match/modules/user_phone/controller/user_phone_controller.dart';
import 'package:match/provider/api/mypage_api.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../provider/service/auth_service.dart';
import '../../../util/components/gloabl_text_field.dart';
import '../../../util/components/global_button.dart';
import '../../../util/const/style/global_logger.dart';

class UserPayMethodScreen extends GetView<UserPayMethodController> {
  const UserPayMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.basic("간편결제 관리"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150.h,
                    ),
                    CardSlider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    // SizedBox(
                    //   height: 48.h,
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.stretch,
                    //     children: [
                    //       Expanded(
                    //         child: Obx(
                    //           () => CommonInputField.phone(
                    //               textController:
                    //                   controller.phoneController.value,
                    //               onChange: (text) async {
                    //                 if (text != "" &&
                    //                     RegExp(r'^01[016789]?\d{3,4}\d{4}$')
                    //                         .hasMatch(text)) {
                    //                   controller.phoneChange.value = true;
                    //                   logger.d(
                    //                       "변경할 번호: $text  ${controller.phoneChange.value}");
                    //                 } else {
                    //                   controller.phoneChange.value = false;
                    //                 }
                    //               }),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 10.w,
                    //       ),
                    //
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: 20.h,
                    ),
                    controller.isPhoneValid.value
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "인증번호 확인",
                                style: AppTextStyles.S1SemiBold14,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                height: 48.h,
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: CommonInputField.phone(
                                          textController: controller
                                              .authCodeController.value,
                                          onChange: (text) async {
                                            if (text != "") {
                                              controller.validNum.value =
                                                  true;
                                            } else {
                                              controller.validNum.value =
                                                  false;
                                            }
                                          }),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    CommonButton.phone(
                                      isActive: controller.validNum.value,
                                      text: "인증번호 확인",
                                      onTap: () async {
                                        controller.isValidCode.value =
                                            await MypageApi.checkCodeWithPhone(
                                                phone: controller
                                                    .phoneController.value.text,
                                                code: controller
                                                    .authCodeController
                                                    .value
                                                    .text);
                                        if (controller.isValidCode.value) {
                                          Fluttertoast.showToast(
                                              msg: "인증되었습니다");
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "올바른 인증번호가 아닙니다.");
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            ),
            Obx(
              () => CommonButton.edit(
                isActive: controller.isValidCode.value,
                onTap: () async {
                  if (controller.newPhone.value != "") {
                    if (controller.newPhone.value !=
                        controller.phoneController.value.text) {
                      Fluttertoast.showToast(
                          msg: "인증된 번호와 다른 번호입니다. 인증 후에 등록해주세요");
                    } else {
                      var result = await MypageApi.setPhone(
                          oldPhone: AuthService.to.myProfile.value.phone,
                          newPhone: controller.newPhone.value);
                      if (result) {
                        AuthService.to.setPhone(controller.newPhone.value);
                        Get.back();
                      }
                    }
                  }
                },
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
