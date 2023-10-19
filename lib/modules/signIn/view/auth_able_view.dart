import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match/model/enum/search_statu.dart';
import 'package:match/modules/signIn/view/login_view.dart';
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

class AuthAbleScreen extends GetView<LoginController> {
  const AuthAbleScreen({super.key});

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: CommonAppBar.basic("회원가입"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 35.h),
                      Text(
                        'MATCH 이용을 위해\n권한을 활성화해주세요.',
                        style: AppTextStyles.T1Bold18,
                      ),
                      SizedBox(height: 30.h),
                      Text(
                          '선택 권한',
                          style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey4)
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        children: [
                          Container(
                            width: 24.w,
                            height: 24.h,
                            child: SvgPicture.asset(
                              iconDir + "login/ic_bell_24.svg",
                              width: 24.w,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                              '알림',
                              style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey8)
                          ),
                          SizedBox(width: 10.w),
                          Text(
                              '후원 진행사항, 이벤트 푸시 알림 수신',
                              style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey6)
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Container(
                            width: 24.w,
                            height: 24.h,
                            child: SvgPicture.asset(
                              iconDir + "login/ic_camera_24.svg",
                              width: 24.w,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                              '사진',
                              style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey8)
                          ),
                          SizedBox(width: 10.w),
                          Text(
                              '프로필 사진 등록',
                              style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey6)
                          ),
                        ],
                      ),
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
                Get.to(LoginScreen());
              },
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

}
