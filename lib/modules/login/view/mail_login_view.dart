import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match/model/enum/search_statu.dart';
import 'package:match/modules/login/view/signup_user_mail_view.dart';
import 'package:match/modules/login/widget/login_widget.dart';
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
    Get.put(LoginController());
    return  Scaffold(
      appBar: CommonAppBar.basic("로그인"),
      body: Column(
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
                SizedBox(height: 20.h),
                Text(
                  '비밀번호',
                  style: AppTextStyles.T1Bold14,
                ),
                SizedBox(height: 10.h),
                CommonTextField(
                    textController: controller.pwTextController.value,
                    isSearchScreen: false, //뒤로가기
                    hasPrefix: false, //검색 아이콘
                    placeHolder: "비밀번호를 입력해주세요.",
                    textStatus: controller.searchStatus,
                    suffixOnTap: () async {},
                    onSubmitted: (value) async {},
                    onChanged: (value) async {},
                    isPlain: true,
                ),
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
                          // "비밀번호 찾기"에 대한 동작을 수행합니다.
                        },
                        child: Text(
                          "비밀번호 찾기",
                          style: AppTextStyles.T1Bold12.copyWith(color: AppColors.grey6),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 280.h),
                CommonButton.login(
                  onTap: () async {
                    Get.back();
                  },
                ),
              ],
            ),
          )
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
