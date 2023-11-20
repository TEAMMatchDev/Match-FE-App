import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:match/model/enum/login_type.dart';
import 'package:match/model/enum/naver_login_state.dart';
import 'package:match/modules/signIn/controller/login_controller.dart';
import 'package:match/provider/api/auth_api.dart';
import 'package:match/provider/routes/routes.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NaverLoginWidget extends StatefulWidget {
  @override
  _NaverLoginState createState() => _NaverLoginState();
}

class _NaverLoginState extends State<NaverLoginWidget> {
  LoginController controller = Get.find<LoginController>();
  NaverLoginUserState accessToken = NaverLoginUserState.accessToken;
  NaverLoginUserState tokenType = NaverLoginUserState.tokenType;

  void signInWithNaver2() async {
    //로그인 성공하면 NaverLoginStatus를 받을 수 있고, NaverAccountResult를 통해 유저 정보 받을 수 ㅇ
    NaverLoginResult naverLoginResult = await FlutterNaverLogin.logIn();

    if (naverLoginResult.status == NaverLoginStatus.loggedIn) {
      print('accessToken = ${naverLoginResult.accessToken}');
      print('id = ${naverLoginResult.account.id}');
      print('email = ${naverLoginResult.account.email}');
      print('name = ${naverLoginResult.account.name}');
      print('phone(+82) = ${naverLoginResult.account.mobile}');
      print('phone(010) = ${naverLoginResult.account.mobile.replaceAll('+82', '0').replaceAll('-', '').replaceAll(' ', '').replaceAll('+', '')}');

      var result = await UserAuthApi.setNaverLogin(token: naverLoginResult.accessToken.toString());
      if(result) {
        controller.setPlatform('naver');
        print(">> 로그인한 플랫폼: ${controller.loginPlatform}");
        Get.offAllNamed(Routes.main);
      } else {
          Fluttertoast.showToast(msg: "로그인에 실패했습니다.");
      }
    }
  }

  Future<UserCredential> signInWithNaver() async {
    final clientState = Uuid().v4();
    final url = Uri.https('nid.naver.com', '/oauth2.0/authorize', {
      'response_type': 'code',
      'client_id': "8SFlnjHGk9S71HcRtHpg",
      'response_mode': 'form_post',
      'redirect_uri':
      'https://warp-dazzling-vegetarian.glitch.me/callback/naver/sign_in/',
      'state': clientState,
    });

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(),
        callbackUrlScheme: "webauthcallback"); //"applink"//"signinwithapple"
    final body = Uri.parse(result).queryParameters;
    print(body["code"]);

    final tokenUrl = Uri.https('nid.naver.com', '/oauth2.0/token', {
      'grant_type': 'authorization_code',
      'client_id': "8SFlnjHGk9S71HcRtHpg",
      'client_secret':'AX2RitUnq3',
      'code': body["code"],
      'state': clientState,
    });
    var customTokenUrl = Uri.parse("https://warp-dazzling-vegetarian.glitch.me/callback/naver/token");

    var responseTokens = await http.post(tokenUrl);
    Map<String, dynamic> bodys = json.decode(responseTokens.body);
    var response = await http.post(
        customTokenUrl,
        body: {"accessToken": bodys['access_token']});
    return FirebaseAuth.instance.signInWithCustomToken(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //signInWithNaver();
      },
      child: Container(
        width: 300.w,
        height: 46.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: AppColors.naverBtn,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 24.w),
            SvgPicture.asset(iconDir + "login/ic_naver_16.svg"),
            SizedBox(width: 30.w),
            Text(
              '네이버로 로그인하고 시작하기',
              style: AppTextStyles.T1Bold14.copyWith(
                  fontWeight: FontWeight.w600, color: AppColors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

}