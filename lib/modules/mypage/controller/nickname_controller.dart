import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../provider/service/auth_service.dart';

class NickNameController extends GetxController {
  Rx<TextEditingController> nicknameController =
  TextEditingController(text: AuthService.to.myProfile.value.nickName).obs;

  Rx<String> newNickname = "".obs;
  Rx<bool> canChange = false.obs;
}
