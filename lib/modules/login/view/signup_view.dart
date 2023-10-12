import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match/model/enum/search_statu.dart';
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

class SignUpScreen extends GetView<LoginController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context){
    Get.put(LoginController());
    return  Scaffold(
      appBar: CommonAppBar.basic("회원가입"),
      body: Column(
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
                      child: CommonTextField(
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
                Text(
                  '비밀번호 확인',
                  style: AppTextStyles.T1Bold14,
                ),
                SizedBox(height: 10.h),
                CommonTextField(
                  textController: controller.pwConfirmTextController.value,
                  isSearchScreen: false, //뒤로가기
                  hasPrefix: false, //검색 아이콘
                  placeHolder: "비밀번호를 입력해주세요.",
                  textStatus: controller.searchStatus,
                  suffixOnTap: () async {},
                  onSubmitted: (value) async {},
                  onChanged: (value) async {},
                  isPlain: true,
                ),
                SizedBox(height: 150.h),
                CommonButton.login(
                  text: "확인",
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