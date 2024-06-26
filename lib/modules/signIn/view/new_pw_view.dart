import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:match/model/enum/search_status.dart';
import 'package:match/modules/signUp/view/signup_user_mail_view.dart';
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
import '../controller/login_controller.dart';

class NewPwScreen extends GetView<LoginController> {
  const NewPwScreen({super.key});

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
                        '새로운 비밀번호를\n입력해주세요.',
                        style: AppTextStyles.T1Bold18,
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        '새 비밀번호',
                        style: AppTextStyles.T1Bold14,
                      ),
                      SizedBox(height: 10.h),
                      //TODO) 01-08 api 연결 & 입력 float 메시지
                      CommonInputField.newPw(
                          textController : controller.newPwController.value,
                          onChange: (value) async {
                            controller.newPw.value = value;
                            print(">>> 입력한 새로운 비밀번호: ${controller.newPw.value}");
                          }),
                      SizedBox(height: 30.h),
                      Text(
                        '새 비밀번호 확인',
                        style: AppTextStyles.T1Bold14,
                      ),
                      SizedBox(height: 10.h),
                      //TODO) 01-08 api 연결 & 입력 float 메시지
                      CommonInputField.newPwConfirm(
                          textController : controller.newPwConfirmController.value,
                          onChange: (value) async {
                            controller.newPwConfirm.value = value;
                            print(">>> 입력한 새로운 비밀번호: ${controller.newPwConfirm.value}");
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 6.w, right: 20),
            child: CommonButton.login(
              text: "확인",
              onTap: () async {
                if (controller.newPw.value == controller.newPwConfirm.value) {
                  var result = await UserAuthApi.modifyPw(email: controller.searchPwEmail.value, code: controller.searchPwAuthNum.value, modifyPassword: controller.newPw.value);
                  if (result) {
                    Fluttertoast.showToast(msg: "비밀번호가 변경되었습니다.");
                    Get.offAllNamed(Routes.login);
                  } else {
                    Fluttertoast.showToast(msg: "비밀번호 변경에 실패했습니다.");
                  }
                } else {
                  Fluttertoast.showToast(msg: "비밀번호와 비밀번호 확인이 일치하지 않습니다.");
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
