import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match/modules/mypage/controller/nickname_controller.dart';
import 'package:match/provider/api/mypage_api.dart';
import 'package:match/util/components/gloabl_text_field.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/components/global_button.dart';

import '../../../provider/service/auth_service.dart';

class NicknameEditScreen extends StatelessWidget {
  TextEditingController nicknameController =
      TextEditingController(text: AuthService.to.myProfile.value.name);

  NicknameEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.basic("닉네임 변경"),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: CommonInputField.nickName(
                textController: nicknameController,
              ),
            ),
          ),
          CommonButton.edit(
            onTap: () async {
              await MypageApi.setNickname(
                  nickName: nicknameController.text);
            },
          )
        ],
      ),
    );
  }
}
