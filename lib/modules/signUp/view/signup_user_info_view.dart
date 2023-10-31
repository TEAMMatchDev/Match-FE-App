import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart'; //Date Format 사용
import 'package:match/model/enum/search_status.dart';
import 'package:match/modules/signUp/controller/signup_controller.dart';
import 'package:match/modules/signUp/view/agreement_view.dart';
import 'package:match/modules/signIn/widget/login_widget.dart';
import 'package:match/modules/signUp/widget/select_gender_widget.dart';
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

class SignUpInfoScreen extends GetView<SignUpController> {
  const SignUpInfoScreen({super.key});

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
                          '기부에 필요한\n정보를 입력해주세요.',
                          style: AppTextStyles.T1Bold18,
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          '이름',
                          style: AppTextStyles.T1Bold14,
                        ),
                        SizedBox(height: 10.h),
                        CommonInputField.userName(
                            textController : controller.userNameTextController.value,
                            onChange: (value) async {
                              print(">>> 입력한 이름: $value");
                            }),
                        SizedBox(height: 20.h),
                        Text(
                          '성별',
                          style: AppTextStyles.T1Bold14,
                        ),
                        SizedBox(height: 10.h),
                        SelectGenderRadioButtons(
                          onGenderSelected: (gender) {
                            print(">>> 선택한 성별: $gender");
                            controller.selectedItemsgendrState.value = gender;
                          },
                        ),
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
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: CallSelectBirthBottomSheet(
                                onBirthSelected: (birth) {
                                  print('>>> 선택한 생년월일: $birth');
                                  controller.birthState.value = birth.toString();
                                },
                              ),
                            ),
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
                              child: CommonInputField.userPhone(
                                  textController : controller.userPhoneTextController.value,
                                  onChange: (value) async {
                                    print(">>> 입력한 전화번호: $value");
                                  }),
                            ),
                            SizedBox(width: 10.w),
                            certinumButton('인증번호 발송'),
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
                              child: CommonInputField.userPhoneConfirm(
                                  textController : controller.userPhoneConfirmTextController.value,
                                  onChange: (value) async {
                                    print(">>> 입력한 인증번호: $value");
                                  }),
                            ),
                            SizedBox(width: 10.w),
                            certinumButton('인증번호 확인'),
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
              //TODO) 01-05 api 연결
              child: CommonButton.login(
                      text: "확인",
                      onTap: () async {
                        Get.to(AgreementScreen());
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
Widget certinumButton(text) {
  return GestureDetector(
    onTap: () {
      //TODO) 01-09 인증번호 발송, 01-05-02 인증번호 확인 api 연결
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
          text,
          style: AppTextStyles.T1Bold13.copyWith(color: AppColors.white),
          textAlign: TextAlign.center, // 중앙 정렬 설정
        ),
      ),
    ),
  );
}