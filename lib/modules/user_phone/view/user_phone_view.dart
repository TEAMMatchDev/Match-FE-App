import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:match/modules/user_phone/controller/user_phone_controller.dart';
import 'package:match/provider/api/mypage_api.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../provider/service/auth_service.dart';
import '../../../util/components/gloabl_text_field.dart';
import '../../../util/components/global_button.dart';
import '../../../util/const/style/global_logger.dart';

class UserPhoneScreen extends GetView<UserPhoneController> {
  const UserPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.basic("휴대폰 번호 변경"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "변경할 휴대폰 번호",
                      style: AppTextStyles.S1SemiBold14,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 48.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: CommonInputField.phone(
                                textController:
                                    controller.phoneController.value,
                                onChange: (text) async {
                                  if (text != "" &&
                                      RegExp(r'^01[016789]?\d{3,4}\d{4}$')
                                          .hasMatch(text)) {
                                    controller.phoneChange.value = true;
                                    logger.d(
                                        "변경할 번호: $text  ${controller.phoneChange.value}");
                                  }
                                  controller.phoneChange.value = false;
                                }),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Obx(
                            ()=> CommonButton.phone(
                              isActive: controller.phoneChange.value,
                              onTap: () async {
                                controller.newPhone.value =
                                    controller.phoneController.value.text;
                                if (controller.newPhone.value ==
                                    AuthService.to.myProfile.value.phone) {
                                  Fluttertoast.showToast(
                                      msg: "등록된 핸드폰과 같은 번호입니다");
                                } else {
                                  controller.isPhoneValid.value =
                                      await MypageApi.getPhoneValidCode(
                                          phone: controller.newPhone.value);
                                  if (controller.isPhoneValid.value) {
                                    Fluttertoast.showToast(msg: "인증번호가 발송되었습니다");
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
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
                                              controller.validNumChange.value =
                                                  true;
                                            } else {
                                              controller.validNumChange.value =
                                                  false;
                                            }
                                          }),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    CommonButton.phone(
                                      isActive: controller.validNumChange.value,
                                      text: "인증번호 확인",
                                      onTap: () async {
                                        controller.isSendValidNum.value = true;
                                        controller.isValidCode.value =
                                            await MypageApi.getPhoneValidCode(
                                                phone: controller
                                                    .phoneController
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
              CommonButton.edit(
                isActive: controller.isValidCode.value,
                onTap: () async {
                  if (controller.newPhone.value != "") {
                    if (controller.newPhone.value !=
                        controller.phoneController.value.text) {
                      Fluttertoast.showToast(
                          msg: "인증된 번호와 다른 번호입니다. 인증 후에 등록해주세요");
                    } else {
                      var result = await MypageApi.setPhone(
                          //TODO: 코드 안정성을 위해, 인증번호 발송후 변수에 저장한값으로 통신
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
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
