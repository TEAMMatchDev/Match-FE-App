import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match/model/enum/search_statu.dart';
import 'package:match/modules/signIn/view/signup_user_mail_view.dart';
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

class FindPWScreen extends GetView<LoginController> {
  const FindPWScreen({super.key});

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
                        '인증번호를 보내드릴\n이메일을 입력해주세요.',
                        style: AppTextStyles.T1Bold18,
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        '이메일',
                        style: AppTextStyles.T1Bold14,
                      ),
                      SizedBox(height: 10.h),
                      CommonTextField(
                        textController: controller.idTextController.value,
                        isSearchScreen: false, //뒤로가기
                        hasPrefix: false, //검색 아이콘
                        placeHolder: "이메일을 입력해주세요.",
                        textStatus: controller.searchStatus,
                        suffixOnTap: () async {},
                        onSubmitted: (value) async {},
                        onChanged: ((value) async {
                          controller.searchStatus.value = SEARCH_STATUS.EDIT;
                        }),
                        isPlain: true,
                      ),
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
                Get.back();
              },
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

}
