import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/model/enum/naver_login_state.dart';
import 'package:match/modules/signIn/view/login_view.dart';
import 'package:match/modules/signIn/widget/apple_login_widget.dart';
import 'package:match/modules/signIn/widget/email_login_widget.dart';
import 'package:match/modules/signIn/widget/kakao_login_widget.dart';
import 'package:match/modules/signIn/widget/naver_login_widget.dart';
import 'package:match/provider/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import '../../../provider/service/auth_service.dart';
import '../../../util/const/style/global_color.dart';

import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart'; //카카오 로그인

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import '../../../model/enum/login_type.dart';
import '../view/mail_login_view.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginWidget> {
  LoginPlatform _loginPlatform = LoginPlatform.none;
  NaverLoginUserState accessToken = NaverLoginUserState.accessToken;
  NaverLoginUserState tokenType = NaverLoginUserState.tokenType;

  void signOut() async {
    switch (_loginPlatform) {
      case LoginPlatform.KAKAO:
        await UserApi.instance.logout();
        break;
      case LoginPlatform.NAVER:
        await FlutterNaverLogin.logOut();
        break;
      case LoginPlatform.APPLE:
        break;
      case LoginPlatform.EMAIL:
        break;
      case LoginPlatform.none:
        break;
    }

    setState(() {
      _loginPlatform = LoginPlatform.none;
    });
  }

  Widget _loginButton(String path, VoidCallback onTap) {
    return Card(
      elevation: 5.0,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: Ink.image(
        image: AssetImage(imgDir + "logo/iv_home_logo.png"),
        width: 120.w,
        height: 60,
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(35.0),
          ),
          onTap: onTap,
        ),
      ),
    );
  }

  Widget _logoutButton() {
    return ElevatedButton(
      onPressed: signOut,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xff0165E1),
        ),
      ),
      child: const Text('로그아웃'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center the Column
        child: _loginPlatform != LoginPlatform.none
            ? _logoutButton()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150.h,
                  ),
                  Image.asset(
                    imgDir + "logo/iv_home_logo.png",
                    width: 120.w,
                  ),
                  SizedBox(height: 84.h),
                  Image.asset(
                    iconDir + "login/iv_login_msg.png",
                    width: 233.w,
                  ),
                  SvgPicture.asset(iconDir + "login/iv_login_msg.png"),
                  KakaoLoginWidget(),
                  SizedBox(
                    height: 12.h,
                  ),
                  NaverLoginWidget(),
                  SizedBox(
                    height: 12.h,
                  ),
                  AppleLoginWidget(),
                  SizedBox(
                    height: 30.h,
                  ),
                  EmailLoginWidget(),
                ],
              ),
      ),
    );
  }


}
