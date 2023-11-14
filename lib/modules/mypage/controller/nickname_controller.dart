import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../provider/service/auth_service.dart';

class NickNameController extends GetxController {
  Rx<TextEditingController> nicknameController =
  ///*닉네임 변경시 textfield controller
  TextEditingController(text: AuthService.to.myProfile.value.nickName).obs;
  ///*닉네임 변경 가능시, api에 보낼 닉네임
  Rx<String> newNickname = "".obs;
  ///*버튼 활성화 여부
  Rx<bool> canChange = false.obs;
}
