import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:match/model/enum/search_status.dart';
import 'package:match/modules/signIn/controller/login_controller.dart';
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

class SignUpMailScreen extends StatefulWidget {
  @override
  _SignUpMailScreenState createState() => _SignUpMailScreenState();
}

class _SignUpMailScreenState extends State<SignUpMailScreen> with WidgetsBindingObserver {

  final LoginController loginController = Get.find<LoginController>();
  SignUpController signUpController = Get.find();


  bool isValidPassword(String password) {
    // 영문, 숫자, 특수문자를 포함하며, 길이가 6-20자인지 검사하는 정규식
    final passwordRegex = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,20}$',
    );
    return passwordRegex.hasMatch(password);
  }

  bool isNullCheck(String input) {
    if (input != ''){
      return true;
    }
    return false;
  }


  @override
  Widget build(BuildContext context){

    final socialIdArg = Get.arguments as Map<String, dynamic>?;
    final socialId = socialIdArg?['socialId'] ?? 'default';
    signUpController.socialId.value = socialId;
    print(">>> signup_user_mail_view:: 저장된 애플유저 socialId: ${socialId}");
    print(">>> signup_user_mail_view:: 저장된 애플유저 socialId: ${signUpController.socialId.value}");

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
                                        textController : signUpController.idTextController.value,
                                        onChange: (value) async {
                                          print(">>> 입력한 회원가입 이메일: $value");
                                          setState(() {
                                            signUpController.signUpId.value = value;
                                          });
                                        }),
                                  ),
                                  SizedBox(width: 10.w),
                                  CommonButton.phone(
                                    verticalPadding: 10,
                                    isActive: true,
                                    onTap: () async {
                                      var chk = await UserAuthApi.postValidCheckEmail(email: signUpController.signUpId.value); /// 중복검사
                                      if (chk) {
                                        var result = await UserAuthApi.getEmailAuth(email: signUpController.signUpId.value); /// 인증번호 전송
                                        if (signUpController.signUpId.value != '' && result) {
                                          Fluttertoast.showToast(msg: "이메일로 인증번호를 발송했습니다.");
                                        } else{
                                          Fluttertoast.showToast(msg: "올바른 이메일 형식이 아닙니다.");
                                        }
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
                                        textController : signUpController.idAuthNumTextController.value,
                                        onChange: (value) async {
                                          print(">>> 입력한 이메일 인증번호: $value");
                                          setState(() {
                                            signUpController.signUpAuthMail.value = value;
                                          });
                                        }),
                                  ),
                                  SizedBox(width: 10.w),
                                  CommonButton.phone(
                                    verticalPadding: 10,
                                    isActive: true,
                                    text: "인증번호 확인",
                                    onTap: () async {
                                      var result = await UserAuthApi.postAuthCheckEmail(email: signUpController.signUpId.value, code: signUpController.signUpAuthMail.value);
                                      if (signUpController.signUpAuthMail.value != '' && result) {
                                        Fluttertoast.showToast(msg: "이메일 인증에 성공했습니다.");
                                        signUpController.authEmail.value = true;
                                      } else{
                                        Fluttertoast.showToast(msg: "올바른 인증번호가 아닙니다.");
                                      }
                                    },
                                  ),
                                ],
                              ),

                              SizedBox(height: 20.h),

                              if(loginController.loginPlatform != 'apple')
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '비밀번호',
                                      style: AppTextStyles.T1Bold14,
                                    ),
                                    SizedBox(height: 10.h),
                                    CommonInputField.signUpPw(
                                        textController : signUpController.pwTextController.value,
                                        onChange: (value) async {
                                          print(">>> 입력한 회원가입 pw: $value");
                                          setState(() {
                                            signUpController.signUpPw.value = value;
                                          });
                                        }),
                                    SizedBox(height: 27.h),
                                    Text(
                                      '비밀번호 확인',
                                      style: AppTextStyles.T1Bold14,
                                    ),
                                    SizedBox(height: 10.h),
                                    CommonInputField.signUpPwConfirm(
                                        textController : signUpController.pwConfirmTextController.value,
                                        onChange: (value) async {
                                          print(">>> 입력한 회원가입 확인pw: $value");
                                          setState(() {
                                            signUpController.signUpPwConfirm.value = value;
                                            if(signUpController.signUpPw.value == signUpController.signUpPwConfirm.value) {
                                              signUpController.validPw.value = true; ///입력한 비밀번호와 비밀번호 확인이 일치하면 비밀번호 유효성 검사 통과
                                            }
                                          });
                                        }),
                                  ],
                                ),
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
              child: (loginController.loginPlatform == 'apple')
                ? _confirmBtnApple()
                : _confirmBtnNomal()
            ),
            SizedBox(height: 24.h),
          ],
      ),
    );
  }

  Widget _confirmBtnApple() {
    // 공통 조건: 이메일 ID와 인증 메일이 비어있지 않은 경우
    if (signUpController.signUpId.value != '' && signUpController.signUpAuthMail.value != '') {
      // Apple 로그인인 경우
      return CommonButton.login(
        text: "확인",
        onTap: () async {
          Get.to(SignUpInfoScreen());
        },
      );
    }
    // 이메일 ID 또는 인증 메일이 입력되지 않은 경우
    else {
      return CommonButton.loginDis(
        text: "확인",
        onTap: () async {},
      );
    }

  }

  Widget _confirmBtnNomal() {
    // 공통 조건: 이메일 ID와 인증 메일이 비어있지 않은 경우
    if (signUpController.signUpId.value != '' && signUpController.signUpAuthMail.value != '' && signUpController.signUpPw.value != '' && signUpController.signUpPwConfirm.value != '') {
      // Apple 로그인이 아니고, 비밀번호 및 비밀번호 확인이 입력된 경우
      return CommonButton.login(
        text: "확인",
        onTap: () async {
          bool isValid = isValidPassword(signUpController.signUpPw.value);
          if (signUpController.authEmail.value && signUpController.validPw.value && isValid) {
            Get.to(SignUpInfoScreen());
          } else {
            Fluttertoast.showToast(msg: "비밀번호 확인 입력값을 다시 확인해주세요.");
          }
        },
      );
    }
    // 비밀번호 또는 비밀번호 확인이 입력되지 않은 경우
    else {
      return CommonButton.loginDis(
        text: "확인",
        onTap: () async {
          Get.to(SignUpInfoScreen());

        },
      );
    }
  }

}