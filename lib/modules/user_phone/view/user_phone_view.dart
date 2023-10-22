import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/modules/user_phone/controller/user_phone_controller.dart';
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
        child: Column(
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
                              textController: controller.phoneController.value,
                              onChange: (text) async {
                                if (text !=
                                        AuthService.to.myProfile.value.phone &&
                                    text != "") {
                                  controller.validNumChange.value = true;
                                } else {
                                  controller.validNumChange.value = false;
                                }
                              }),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CommonButton.phone(
                          onTap: () async {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  controller.isSendValidNum.value
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: CommonInputField.phone(
                                        textController:
                                            controller.authCodeController.value,
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
                                    text: "인증번호 확인",
                                    onTap: () async {},
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
              isActive: controller.canChange.value,
              onTap: () async {
                // await MypageApi.setPhone(
                //     oldPho: nicknameController.text);
              },
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
