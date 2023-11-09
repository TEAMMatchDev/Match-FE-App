import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:match/model/enum/login_type.dart';
import 'package:match/model/enum/naver_login_state.dart';
import 'package:match/provider/routes/routes.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

class NaverLoginWidget extends StatefulWidget {
  @override
  _NaverLoginState createState() => _NaverLoginState();
}

class _NaverLoginState extends State<NaverLoginWidget> {
  LoginPlatform _loginPlatform = LoginPlatform.none;
  NaverLoginUserState accessToken = NaverLoginUserState.accessToken;
  NaverLoginUserState tokenType = NaverLoginUserState.tokenType;

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        signInWithNaver();
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
            SizedBox(width: 80.w),
            Text(
              '네이버 로그인',
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