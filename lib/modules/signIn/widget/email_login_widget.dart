import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:match/modules/signIn/view/mail_login_view.dart';
import 'package:match/provider/routes/routes.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

class EmailLoginWidget extends StatefulWidget {
  @override
  _EmailLoginState createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLoginWidget> {



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        // 홈-후원처 개발을 위한 임시 라우팅
        // await Get.offAllNamed(Routes.main);
        Get.to(EmailLoginScreen());
      },
      child: Container(
        width: 300.w,
        height: 18.h,
        child: Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '이미 계정이 있나요? ',
                  style: AppTextStyles.T1Bold12.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.grey4),
                ),
                TextSpan(
                    text: '이메일 로그인',
                    style:
                    AppTextStyles.T1Bold12.copyWith(color: Colors.black)),
              ],
            ),
          ),
        ),
      ),
    );
  }

}