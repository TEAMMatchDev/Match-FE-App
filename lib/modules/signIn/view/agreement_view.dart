import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match/model/enum/search_statu.dart';
import 'package:match/modules/signIn/view/auth_able_view.dart';
import 'package:match/modules/signIn/view/signup_user_mail_view.dart';
import 'package:match/modules/signIn/widget/checkbox_widget.dart';
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

class AgreementScreen extends GetView<LoginController> {
  const AgreementScreen({super.key});

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: CommonAppBar.basic("이용약관"),
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
                      RichText(
                        text: TextSpan(
                          style: AppTextStyles.T1Bold18, // Default text style for the entire text
                          children: [
                            TextSpan(
                              text: 'M',
                              style: TextStyle(
                                color: AppColors.primaryRed, // Set the color to #D15347
                                fontWeight: FontWeight.bold, // You can apply other styles as needed
                              ),
                            ),
                            TextSpan(text: 'ATCH 서비스 이용약관에\n동의해주세요.'),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.h),

                      CheckBoxExample(),
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
                Get.to(AuthAbleScreen());
              },
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

}
