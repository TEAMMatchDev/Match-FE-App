import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../model/enum/search_status.dart';

class SignUpController extends GetxController {

  RxString signUpId = ''.obs; //id
  RxString signUpAuthMail = ''.obs; //id 인증번호
  RxBool authEmail = false.obs; //이메일 인증 완료 여부
  RxBool validEmail = false.obs; //이메일 중복검사
  RxString signUpPw = ''.obs; //pw
  RxString signUpPwConfirm = ''.obs; //pw 확인
  RxBool validPw = false.obs; //pw 유효성 검사

  RxString signUpName = ''.obs;
  RxString signUpGender = ''.obs;
  RxString signUpBirth = ''.obs;
  RxString signUpPhone = ''.obs; //전화번호
  RxString signUpPhoneConfirm = ''.obs; //전화번호 인증번호

  //TODO) signUp controller
  /// 회원가입 > id, pw, pw확인
  Rx<TextEditingController> idTextController = TextEditingController().obs;
  Rx<TextEditingController> pwConfirmTextController = TextEditingController().obs;
  Rx<TextEditingController> idAuthNumTextController = TextEditingController().obs;
  Rx<TextEditingController> pwTextController = TextEditingController().obs;


  //TODO) 회원가입 > 회원정보
  /// 회원정보 > 이름
  Rx<TextEditingController> userNameTextController = TextEditingController().obs;
  /// 회원정보 > 성별
  var selectedItemsgendrState = ''.obs;
  /// 회원정보 > 생년월일
  var birthState = "".obs;
  /// 회원정보 > 휴대폰번호
  Rx<TextEditingController> userPhoneTextController = TextEditingController().obs;
  /// 회원정보 > 휴대폰번호 인증
  Rx<TextEditingController> userPhoneConfirmTextController = TextEditingController().obs;

  //TODO) 회원가입 > 이용약관
  /// 이용약관
  var selectedItems = <String>[].obs;

  //TODO) 회원가입 > 권한(알림 & 사진)
  /// 알림권한
  var noticeAuth = false.obs;
  /// 사진권한
  var pictureAuth = false.obs;


  @override
  void onInit() {
    super.onInit();
  }
}
