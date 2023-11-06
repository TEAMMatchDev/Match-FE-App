import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../model/enum/search_status.dart';

class LoginController extends GetxController {
  //TODO) signIn controller
  Rx<TextEditingController> idTextController = TextEditingController().obs;
  Rx<TextEditingController> pwTextController = TextEditingController().obs;

  RxString userId = ''.obs;
  RxString userPw = ''.obs;

  //비밀번호 찾을 때 입력하는 이메일
  Rx<TextEditingController> findPwTextController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
  }
}
