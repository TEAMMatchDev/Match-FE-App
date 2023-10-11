import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/model/enum/naver_login_state.dart';
import 'package:match/modules/login/view/login_view.dart';
import 'package:match/provider/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import '../../../util/const/style/global_color.dart';

import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart'; //카카오 로그인

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import '../../../model/enum/login_type.dart';

void main() => runApp(LoginWidget());

class LoginWidget extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginWidget> {
  LoginPlatform _loginPlatform = LoginPlatform.none;
  NaverLoginUserState accessToken = NaverLoginUserState.accessToken;
  NaverLoginUserState tokenType = NaverLoginUserState.tokenType;

  bool _isKakaoTalkInstalled = false;
  var validateToken;

  @override
  void initState() {
    super.initState();
    initKakaoTalkInstalled();
  }

  void initKakaoTalkInstalled() async {
    final installed = await isKakaoTalkInstalled();
    print('>> 카카오톡 Install: ' + installed.toString());

    setState(() {
      _isKakaoTalkInstalled = installed;
    });
  }

  void sighInWithKakao() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();

      OAuthToken token = isInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();

      final url = Uri.https('kapi.kakao.com', '/v2/user/me');
      final response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'
        },
      );

      final profileInfo = json.decode(response.body);
      print(profileInfo.toString());

      print('>> accessToken: '+token.accessToken);

      setState(() {
        _loginPlatform = LoginPlatform.kakao;
      });
      Get.toNamed(Routes.main);

    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');
    }
  }

  void signInWithNaver() async {
    //로그인 성공하면 NaverLoginStatus를 받을 수 있고, NaverAccountResult를 통해 유저 정보 받을 수 ㅇ
    final NaverLoginResult result = await FlutterNaverLogin.logIn();

    if (result.status == NaverLoginStatus.loggedIn) {
      print('accessToken = ${result.accessToken}');
      print('id = ${result.account.id}');
      print('email = ${result.account.email}');
      print('name = ${result.account.name}');

      setState(() {
        _loginPlatform = LoginPlatform.naver;
      });
      Get.toNamed(Routes.home);
    }
  }

  void signOut() async {
    switch (_loginPlatform) {
      case LoginPlatform.facebook:
        break;
      case LoginPlatform.google:
        break;
      case LoginPlatform.kakao:
        await UserApi.instance.logout();
        break;
      case LoginPlatform.naver:
        await FlutterNaverLogin.logOut();
        break;
      case LoginPlatform.apple:
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
      body: Center( // Center the Column
        child: _loginPlatform != LoginPlatform.none
            ? _logoutButton()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the children vertically
          children: [
            SizedBox(
              height: 150.h,
            ),
            Image.asset(
              imgDir + "logo/iv_home_logo.png",
              width: 120.w,
            ),
            SizedBox(
              height: 150.h,
            ),
            kakaoLogin(),
            SizedBox(
              height: 12.h,
            ),
            naverLogin(signInWithNaver),
            SizedBox(
              height: 12.h,
            ),
            appleLogin(),
            SizedBox(
              height: 30.h,
            ),
            mailLogin(),],
        ),
      ),
    );
  }


  @override
  Widget kakaoLogin() {
    return GestureDetector(
      onTap: () async {
        try {
          if (await isKakaoTalkInstalled()) { /// 카카오톡이 설치 되어있는 경우
            try {
              await UserApi.instance.loginWithKakaoTalk();
              print('카카오톡으로 로그인 성공');
              sighInWithKakao();
              Get.toNamed(Routes.main);
            } catch (error) {
              print('카카오톡으로 로그인 실패 $error');

              // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
              // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
              if (error is PlatformException && error.code == 'CANCELED') {
                return;
              }
              // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
              try {
                await UserApi.instance.loginWithKakaoAccount();
                print('카카오계정으로 로그인 성공');
                sighInWithKakao();
                Get.toNamed(Routes.main);
              } catch (error) {
                print('카카오계정으로 로그인 실패 $error');
              }
            }
          }
          else { /// 카카오톡 미설치 경우
            try {
              await UserApi.instance.loginWithKakaoAccount();
              print('카카오계정으로 로그인 성공');
              sighInWithKakao();
              Get.toNamed(Routes.main);
            } catch (error) {
              print('카카오계정으로 로그인 실패 $error');
            }
          }
        } catch (error) {
          print('Kakao 로그인 실패: $error');
          // 사용자가 KakaoTalk 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
          // 의도적인 로그인 취소로 간주하고 Kakao 계정 로그인을 시도하지 않음 (예: 뒤로 가기)
          if (error is PlatformException && error.code == 'CANCELED') {
            return;
          }
        }
      },
      child: Container(
        width: 300.w,
        height: 46.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: AppColors.kakaoBtn,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 24.w),
            SvgPicture.asset(iconDir + "login/ic_kakao_19.svg"),
            SizedBox(width: 80.w),
            Text(
              '카카오 로그인',
              style: AppTextStyles.T1Bold14.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget naverLogin(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      //   onTap: () async {
      //     try {
      //       signInWithNaver();
      //     } catch (error) {
      //       print('Naver 로그인 실패: $error');
      //     }
      // },
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
            SizedBox(width: 80.w),
            Text(
              '네이버 로그인',
              style: AppTextStyles.T1Bold14.copyWith(fontWeight: FontWeight.w600, color: AppColors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget appleLogin() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.home);
      },
      child: Container(
        width: 300.w,
        height: 46.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), // Set border radius to 10px
          color: AppColors.appleBtn, // Button's background color
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 24.w), // Add some spacing between the icon and text
            SvgPicture.asset(iconDir + "login/ic_apple_20.svg"), // Include your SVG here
            SizedBox(width: 80.w), // Add some spacing between the icon and text
            Text(
              '애플 로그인',
              style: AppTextStyles.T1Bold14.copyWith(fontWeight: FontWeight.w600, color: AppColors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget mailLogin() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.home);
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
                  style: AppTextStyles.T1Bold12.copyWith(fontWeight: FontWeight.w500, color: AppColors.grey4),
                ),
                TextSpan(
                    text: '이메일 로그인',
                    style: AppTextStyles.T1Bold12.copyWith(color: Colors.black)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}