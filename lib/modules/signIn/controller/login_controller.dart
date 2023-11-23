import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:match/model/enum/login_type.dart';

import '../../../model/enum/search_status.dart';

class LoginController extends GetxController {
  //TODO) signIn controller
  Rx<TextEditingController> idTextController = TextEditingController().obs;
  Rx<TextEditingController> pwTextController = TextEditingController().obs;

  RxString userId = ''.obs;
  RxString userPw = ''.obs;

  RxString searchPwEmail = ''.obs; //비밀번호 찾을 때 입력하는 이메일
  RxString searchPwAuthNum = ''.obs; //이메일 인증번호
  RxString newPw = ''.obs; //새로운 비밀번호
  RxString newPwConfirm = ''.obs; //새로운 비밀번호 확인
  //비밀번호 찾을 때 입력하는 이메일
  Rx<TextEditingController> findPwEmailTextController = TextEditingController().obs;
  //비밀번호 찾을 때 입력하는 인증번호
  Rx<TextEditingController> findPwAuthNumTextController = TextEditingController().obs;

  //새로운 비밀번호 & 비밀번호 확인
  Rx<TextEditingController> newPwController = TextEditingController().obs;
  Rx<TextEditingController> newPwConfirmController = TextEditingController().obs;

  /// 로그인한 플랫폼
  var loginPlatform = ''.obs;
  void setPlatform(String str) {
    loginPlatform.value = str;
  }
  var appleLoginCode = ''.obs;
  void setAppleLoginCode(String code) {
    appleLoginCode.value = code;
  }
  var appleLoginToken = ''.obs;
  void setAppleLoginToken(String token) {
    appleLoginToken.value = token;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
