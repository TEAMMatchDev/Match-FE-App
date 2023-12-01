import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:match/modules/mypage/controller/nickname_controller.dart';
import 'package:match/provider/api/mypage_api.dart';
import 'package:match/util/components/gloabl_text_field.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/components/global_button.dart';

import '../../../provider/service/auth_service.dart';

class NicknameEditScreen extends GetView<NickNameController> {
  const NicknameEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.basic("닉네임 변경"),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: Center(
                child: CommonInputField.nickName(
                  textController: controller.nicknameController.value,
                  onChange: (text) async {
                    if (text != AuthService.to.nickName.value &&
                        text != "") {
                      controller.canChange.value = true;
                    } else {
                      controller.canChange.value = false;
                    }
                  },
                ),
              ),
            ),
            CommonButton.edit(
              isActive: controller.canChange.value,
              onTap: () async {
                controller.newNickname.value =
                    controller.nicknameController.value.text;
                var result = await MypageApi.setNickname(
                    nickName: controller.newNickname.value);
                if (result) {
                  AuthService.to.nickName.value = controller.newNickname.value;
                  Get.back();
                } else {
                  Fluttertoast.showToast(msg: "변경에 실패하였습니다. 다시 시도해주세요");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
