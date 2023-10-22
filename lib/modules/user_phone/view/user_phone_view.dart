import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:match/modules/user_phone/controller/user_phone_controller.dart';
import 'package:match/provider/api/mypage_api.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../provider/service/auth_service.dart';
import '../../../util/components/gloabl_text_field.dart';
import '../../../util/components/global_button.dart';

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
                                  //else if (text ==
                                  //     AuthService.to.myProfile.value.phone) {
                                  //   Fluttertoast.showToast(msg: "변경된 번호가 아닙니다");
                                  // } else {
                                  //   Fluttertoast.showToast(msg: "올바른 번호를 입력해주세요");
                                  // }
                                  if (text !=
                                          AuthService
                                              .to.myProfile.value.phone &&
                                      text != "" &&
                                      RegExp(r'^01[016789]?\d{3,4}\d{4}$')
                                          .hasMatch(text)) {
                                    controller.phoneChange.value = true;
                                  }
                                  // controller.phoneChange.value = false;
                                }),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CommonButton.phone(
                            isActive: controller.phoneChange.value,
                            onTap: () async {
                              controller.isPhoneValid.value =
                                  await MypageApi.getPhoneValidCode(
                                      phone: controller
                                          .phoneController.value.text);
                              if (controller.isPhoneValid.value) {
                                Fluttertoast.showToast(msg: "인증번호가 발송되었습니다");
                              }
                            },
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
                  var result = await MypageApi.setPhone(
                      oldPhone: AuthService.to.myProfile.value.phone,
                      newPhone: controller.phoneController.value.text);
                  if(result){
                    //TODO: change phone number in AuthService
                    Get.back();
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
