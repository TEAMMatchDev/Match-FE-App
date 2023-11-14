import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:match/model/enum/search_status.dart';
import 'package:match/modules/signUp/controller/signup_controller.dart';
import 'package:match/modules/signUp/view/signup_user_info_view.dart';
import 'package:match/modules/signIn/widget/login_widget.dart';
import 'package:match/provider/api/auth_api.dart';
import 'package:match/util/components/gloabl_text_field.dart';
import 'package:match/util/components/global_button.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import '../../../util/components/global_app_bar.dart';
import '../../../util/const/style/global_color.dart';

import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart'; //카카오 로그인
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';


import '../../../provider/routes/routes.dart';

class SignUpMailScreen extends GetView<SignUpController> {
  const SignUpMailScreen({super.key});

  bool isValidPassword(String password) {
    // 영문, 숫자, 특수문자를 포함하며, 길이가 6-20자인지 검사하는 정규식
    final passwordRegex = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,20}$',
    );
    return passwordRegex.hasMatch(password);
  }

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: CommonAppBar.basic("회원가입"),
      body: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                      children: [
                        SizedBox(height: 35.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '로그인할 이메일과\n비밀번호를 입력해주세요.',
                                style: AppTextStyles.T1Bold18,
                              ),
                              SizedBox(height: 30.h),
                              Text(
                                '이메일',
                                style: AppTextStyles.T1Bold14,
                              ),
                              SizedBox(height: 10.h),

                              Row(
                                children: [
                                  Expanded(
                                    child: CommonInputField.signInID(
                                        textController : controller.idTextController.value,
                                        onChange: (value) async {
                                          print(">>> 입력한 회원가입 이메일: $value");
                                          controller.signUpId.value = value;
                                        }),
                                  ),
                                  SizedBox(width: 10.w),
                                  CommonButton.phone(
                                    verticalPadding: 10,
                                    isActive: true,
                                    onTap: () async {

                                      var chk = await UserAuthApi.postValidCheckEmail(email: controller.signUpId.value); /// 중복검사
                                      if (chk) {
                                        var result = await UserAuthApi.getEmailAuth(email: controller.signUpId.value); /// 인증번호 전송
                                        if (controller.signUpId.value != '' && result) {
                                          Fluttertoast.showToast(msg: "이메일로 인증번호를 발송했습니다.");
                                        } else{
                                          Fluttertoast.showToast(msg: "올바른 이메일 형식이 아닙니다.");
                                        }
                                      } else {
                                        Fluttertoast.showToast(msg: "중복된 이메일로 가입할 수 없습니다.");
                                      }
                                    },
                                  ),
                                ],
                              ),

                              SizedBox(height: 20.h),

                              Text(
                                '인증번호 입력',
                                style: AppTextStyles.T1Bold14,
                              ),
                              SizedBox(height: 10.h),

                              Row(
                                children: [
                                  Expanded(
                                    child: CommonInputField.signUpIdConfirm(
                                        textController : controller.idAuthNumTextController.value,
                                        onChange: (value) async {
                                          print(">>> 입력한 이메일 인증번호: $value");
                                          controller.signUpAuthMail.value = value;
                                        }),
                                  ),
                                  SizedBox(width: 10.w),
                                  CommonButton.phone(
                                    verticalPadding: 10,
                                    isActive: true,
                                    text: "인증번호 확인",
                                    onTap: () async {
                                      var result = await UserAuthApi.postAuthCheckEmail(email: controller.signUpId.value, code: controller.signUpAuthMail.value);
                                      if (controller.signUpAuthMail.value != '' && result) {
                                        Fluttertoast.showToast(msg: "이메일 인증에 성공했습니다.");
                                        controller.authEmail.value = true;
                                      } else{
                                        Fluttertoast.showToast(msg: "올바른 인증번호가 아닙니다.");
                                      }
                                    },
                                  ),
                                ],
                              ),

                              SizedBox(height: 20.h),

                              Text(
                                '비밀번호',
                                style: AppTextStyles.T1Bold14,
                              ),
                              SizedBox(height: 10.h),
                              CommonInputField.signUpPw(
                                  textController : controller.pwTextController.value,
                                  onChange: (value) async {
                                    print(">>> 입력한 회원가입 pw: $value");
                                    controller.signUpPw.value = value;
                                  }),
                              SizedBox(height: 27.h),
                              Text(
                                '비밀번호 확인',
                                style: AppTextStyles.T1Bold14,
                              ),
                              SizedBox(height: 10.h),
                              CommonInputField.signUpPwConfirm(
                                  textController : controller.pwConfirmTextController.value,
                                  onChange: (value) async {
                                    print(">>> 입력한 회원가입 확인pw: $value");
                                    controller.signUpPwConfirm.value = value;
                                    if(controller.signUpPw.value == controller.signUpPwConfirm.value) {
                                      controller.validPw.value = true; ///입력한 비밀번호와 비밀번호 확인이 일치하면 비밀번호 유효성 검사 통과
                                    }
                                  }),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
            ),

            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              //TODO) 01-06 api 연결
              child: CommonButton.login(
                text: "확인",
                onTap: () async {
                  bool isValid = isValidPassword(controller.signUpPw.value);
                  if (controller.authEmail.value && controller.validPw.value && isValid) {
                    Get.to(SignUpInfoScreen());
                  }
                  else {
                    Fluttertoast.showToast(msg: "비밀번호 확인 입력값을 다시 확인해주세요.");
                  }
                },
              ),
            ),
            SizedBox(height: 24.h),
          ],
      ),
    );
  }

}