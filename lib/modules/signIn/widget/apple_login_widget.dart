import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:match/model/enum/login_type.dart';
import 'package:match/modules/signIn/controller/login_controller.dart';
import 'package:match/modules/signUp/controller/signup_controller.dart';
import 'package:match/provider/api/auth_api.dart';
import 'package:match/provider/api/util/global_api_field.dart';
import 'package:match/provider/routes/routes.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../provider/service/auth_service.dart';
import '../../tutorial/view/init_tutorial_view.dart';

class AppleLoginWidget extends StatefulWidget {
  @override
  _AppleLoginState createState() => _AppleLoginState();
}

class _AppleLoginState extends State<AppleLoginWidget> {
  LoginController loginController = Get.find<LoginController>();
  SignUpController signUpController = Get.find();

  Future<void> signInWithApple() async {
    try {
      final AuthorizationCredentialAppleID credential =
      await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: dotenv.env['appleServiceId']!,
          redirectUri: Uri.parse(dotenv.env['appleRedirectUri']!),
        ),
      );

      // 인증 성공 후 처리
      // print('>>> 애플로그인 사용자 정보 : credential 전체 = $credential');
      // print('>>> 애플로그인 사용자 정보 : userIdentifier = ${credential.userIdentifier}');
      // print('>>> 애플로그인 사용자 정보 : givenName = ${credential.givenName}');
      // print('>>> 애플로그인 사용자 정보 : familyName = ${credential.familyName}');
      // print('>>> 애플로그인 사용자 정보 : authorizationCode = ${credential.authorizationCode}');
      // print('>>> 애플로그인 사용자 정보 : email = ${credential.email}');
      // print('>>> 애플로그인 사용자 정보 : identityToken = ${credential.identityToken}');
      // print('>>> 애플로그인 사용자 정보 : state = ${credential.state}');

      loginController.setAppleLoginCode(credential.authorizationCode);
      loginController.appleLoginCode.value = credential.authorizationCode.toString();
      print(">>> 애플유저 코드: ${loginController.appleLoginCode.value}");
      loginController.setAppleLoginToken(credential.identityToken.toString());
      loginController.appleLoginToken.value = credential.identityToken.toString();
      print(">>> 애플유저 토큰: ${loginController.appleLoginToken.value}");

      var result = await UserAuthApi.setAppleLogin(accessToken: credential.identityToken.toString());

      if (result) { /// true : 기존 애플유저 / false : 신규 애플유저
        Fluttertoast.showToast(msg: "애플 로그인 성공!");
        loginController.setPlatform('apple');

        if(AuthService.to.isTutorial.value) {
          await AuthService.to.getUserInfo();
          Get.to(()=>const InitTutorialScreen());
        }
        else {
          Get.offAllNamed(Routes.main);
        }
      } else {
        // false 일 때 socailId 출력
        Fluttertoast.showToast(msg: "애플유저 회원가입을 진행합니다.");
        loginController.setPlatform('apple');
        print(">>> apple_login_widget:: controller에 저장된 socialId: ${signUpController.socialId.value}");
        Get.to(Routes.sign_up, arguments: {'socialId': signUpController.socialId.value});
      }

    } catch (error) {
      // 인증 실패시 에러 처리
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        signInWithApple();
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
            SizedBox(width: 24.w),
            SvgPicture.asset(iconDir + "login/ic_apple_20.svg"),
            SizedBox(width: 28.w),
            Text(
              'Apple로 로그인하고 시작하기',
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

