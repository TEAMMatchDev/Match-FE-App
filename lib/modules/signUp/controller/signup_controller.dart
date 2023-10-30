import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../model/enum/search_status.dart';

class SignUpController extends GetxController {
  //TODO) signUp controller
  /// 회원가입 > id, pw, pw확인
  Rx<TextEditingController> idTextController = TextEditingController().obs;
  Rx<TextEditingController> pwTextController = TextEditingController().obs;
  Rx<TextEditingController> pwConfirmTextController = TextEditingController().obs;

  //TODO) 회원가입 > 회원정보
  /// 회원정보 > 이름
  Rx<TextEditingController> userNameTextController = TextEditingController().obs;
  /// 회원정보 > 성별
  var gendrState = ''.obs;
  /// 회원정보 > 생년월일
  var birthState = "".obs;
  /// 회원정보 > 휴대폰번호
  Rx<TextEditingController> userPhoneTextController = TextEditingController().obs;
  /// 회원정보 > 휴대폰번호 인증
  Rx<TextEditingController> userPhoneConfirmTextController = TextEditingController().obs;



  @override
  void onInit() {
    super.onInit();
  }
}
