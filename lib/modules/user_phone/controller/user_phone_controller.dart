import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../provider/service/auth_service.dart';

class UserPhoneController extends GetxController {
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> authCodeController = TextEditingController().obs;
  ///* 휴대폰 번호 textField 옆 버튼 활성화 여부
  Rx<bool> phoneChange = false.obs;

  ///*인증번호 입력 field 활성화 여부
  Rx<bool> isPhoneValid = false.obs;
  Rx<String> newPhone = "".obs;

  ///* 인증 번호 textField 옆 버튼 활성화 여부
  Rx<bool> validNumChange = false.obs;

  ///*인증코드 발송여부
  Rx<bool> isSendValidNum = false.obs;

  ///*인증코드 유효 여부및 변경완료 버튼 활성화여부
  Rx<bool> isValidCode= false.obs;
}
