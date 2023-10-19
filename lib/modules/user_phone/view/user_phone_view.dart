import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match/modules/user_phone/controller/user_phone_controller.dart';
import 'package:match/util/components/global_app_bar.dart';

import '../../../util/components/gloabl_text_field.dart';
import '../../../util/components/global_button.dart';

class UserPhoneScreen extends GetView<UserPhoneController> {
  const UserPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.basic("휴대폰 번호 변경"),
      body: Column(
        children: [
          Column(children: [
            Row(
              children: [
                CommonInputField.phone(
                    textController: controller.phoneController.value),
                CommonButton(onTap: () async {}, text: "인증번호 전송"),
              ],
            )
          ]),
          CommonButton.edit(
            onTap: () async {
              // await MypageApi.setPhone(
              //     oldPho: nicknameController.text);
            },
          )
        ],
      ),
    );
  }
}
