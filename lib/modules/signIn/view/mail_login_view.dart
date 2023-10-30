import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match/model/enum/search_status.dart';
import 'package:match/modules/signIn/view/find_pw_view.dart';
import 'package:match/modules/signIn/view/login_view.dart';
import 'package:match/modules/signUp/view/signup_user_mail_view.dart';
import 'package:match/modules/signIn/widget/login_widget.dart';
import 'package:match/modules/main/view/main_view.dart';
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

class EmailLoginScreen extends GetView<LoginController> {
  const EmailLoginScreen({super.key});

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: CommonAppBar.basic("로그인"),
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
                          '이메일',
                          style: AppTextStyles.T1Bold14,
                        ),
                        SizedBox(height: 10.h),
                        //TODO) api 연동
                        CommonInputField.signInID(
                            textController : controller.idTextController.value,
                            onChange: (value) async {
                              print(">>> 입력한 id: $value");
                            }),
                        SizedBox(height: 20.h),
                        Text(
                          '비밀번호',
                          style: AppTextStyles.T1Bold14,
                        ),
                        SizedBox(height: 10.h),
                      CommonInputField.signInPW(
                          textController : controller.pwTextController.value,
                          onChange: (value) async {
                            print(">>> 입력한 pw: $value");
                          }),
                        SizedBox(height: 27.h),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(SignUpMailScreen());
                                },
                                child: Text(
                                  "회원가입",
                                  style: AppTextStyles.T1Bold12.copyWith(color: AppColors.grey6),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                "|",
                                style: AppTextStyles.T1Bold12.copyWith(color: AppColors.grey1),
                              ),
                              SizedBox(width: 10.w),
                              GestureDetector(
                                onTap: () {
                                  Get.to(FindPWScreen());
                                },
                                child: Text(
                                  "비밀번호 찾기",
                                  style: AppTextStyles.T1Bold12.copyWith(color: AppColors.grey6),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CommonButton.login(
                text: "로그인",
                onTap: () async {
                  Get.to(MainScreen());
                },
              ),
            ),
            SizedBox(height: 24.h),
          ],
      ),
    );
  }

}



/*child: GestureDetector(
onTap: () {
Get.toNamed(Routes.home);
},
child: Text('login'))*/
