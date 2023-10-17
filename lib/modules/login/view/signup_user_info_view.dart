import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart'; //Date Format 사용
import 'package:match/model/enum/search_statu.dart';
import 'package:match/modules/login/widget/login_widget.dart';
import 'package:match/modules/login/widget/select_sex_widget.dart';
import 'package:match/util/components/gloabl_text_field.dart';
import 'package:match/util/components/global_button.dart';
import 'package:match/util/components/global_date_picker.dart';
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

class SignUpInfoScreen extends GetView<LoginController> {
  const SignUpInfoScreen({super.key});

  @override
  Widget build(BuildContext context){
    Get.put(LoginController());
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
                          '기부에 필요한\n정보를 입력해주세요.',
                          style: AppTextStyles.T1Bold18,
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          '이름',
                          style: AppTextStyles.T1Bold14,
                        ),
                        SizedBox(height: 10.h),
                        CommonTextField(
                          textController: controller.idTextController.value,
                          isSearchScreen: false, //뒤로가기
                          hasPrefix: false, //검색 아이콘
                          placeHolder: "이름을 입력해주세요.",
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
                          '성별',
                          style: AppTextStyles.T1Bold14,
                        ),
                        SizedBox(height: 10.h),
                        SelectSexRadioButtons(),
                        SizedBox(height: 20.h),
                        Text(
                          '생년월일',
                          style: AppTextStyles.T1Bold14,
                        ),
                        SizedBox(height: 10.h),
                        SizedBox(
                          width: double.infinity,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey1),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: CallBottomSheet(),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          '휴대폰 번호',
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
                                placeHolder: "- 없이 번호만 입력해주세요.",
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
                          '휴대폰 번호 인증',
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
                                placeHolder: "인증번호를 입력해주세요.",
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
                        SizedBox(height: 27.h),
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