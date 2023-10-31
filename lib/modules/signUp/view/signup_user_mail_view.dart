import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match/model/enum/search_status.dart';
import 'package:match/modules/signUp/controller/signup_controller.dart';
import 'package:match/modules/signUp/view/signup_user_info_view.dart';
import 'package:match/modules/signIn/widget/login_widget.dart';
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

void main() => runApp(SignUpMailScreen());

class SignUpMailScreen extends GetView<SignUpController> {
  const SignUpMailScreen({super.key});

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: CommonAppBar.basic("회원가입"),
      body: Column(
          children: <Widget>[
            Expanded(
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
                                  }),
                            ),
                            SizedBox(width: 10.w),
                            certinumButton(),
                          ],
                        ),

                        SizedBox(height: 20.h),
                        Text(
                          '비밀번호',
                          style: AppTextStyles.T1Bold14,
                        ),
                        SizedBox(height: 10.h),
                        CommonInputField.signInPW(
                            textController : controller.pwTextController.value,
                            onChange: (value) async {
                              print(">>> 입력한 회원가입 pw: $value");
                            }),
                        SizedBox(height: 27.h),
                        Text(
                          '비밀번호 확인',
                          style: AppTextStyles.T1Bold14,
                        ),
                        SizedBox(height: 10.h),
                        CommonInputField.signInPW(
                            textController : controller.pwConfirmTextController.value,
                            onChange: (value) async {
                              print(">>> 입력한 회원가입 확인pw: $value");
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              //TODO) 01-06 api 연결
              child: CommonButton.login(
                text: "확인",
                onTap: () async {
                  Get.to(SignUpInfoScreen());
                },
              ),
            ),
            SizedBox(height: 24.h),
          ],
      ),
    );
  }

}


@override
Widget certinumButton() {
  return GestureDetector(
    onTap: () {
      //Get.toNamed(Routes.home);
    },
    child: Container(
      width: 92.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // Set border radius to 10px
        color: AppColors.grey10, // Button's background color
      ),
      child: Center(
        child: Text(
          '인증번호 발송',
          style: AppTextStyles.T1Bold13.copyWith(color: AppColors.white),
          textAlign: TextAlign.center, // 중앙 정렬 설정
        ),
      ),
    ),
  );
}