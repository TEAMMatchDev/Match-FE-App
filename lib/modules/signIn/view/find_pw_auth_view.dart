import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match/model/enum/search_status.dart';
import 'package:match/modules/signIn/view/new_pw_view.dart';
import 'package:match/modules/signUp/view/signup_user_mail_view.dart';
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
import '../controller/login_controller.dart';

class FindPwAuthScreen extends GetView<LoginController> {
  const FindPwAuthScreen({super.key});

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: CommonAppBar.basic("비밀번호 찾기"),
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
                        '이메일에 전송된\n인증번호를 입력해주세요.',
                        style: AppTextStyles.T1Bold18,
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        '인증번호 입력',
                        style: AppTextStyles.T1Bold14,
                      ),
                      SizedBox(height: 10.h),
                      //TODO) 01-10 api 연결 & 입력 float 메시지
                      CommonInputField.findPwAuthNum(
                          textController : controller.findPwAuthNumTextController.value,
                          onChange: (value) async {
                            print(">>> 입력한 인증번호: $value");
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
            child: CommonButton.login(
              text: "확인",
              onTap: () async {
                Get.to(NewPwScreen());
              },
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

}
