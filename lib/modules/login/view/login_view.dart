import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart'; //카카오 로그인

import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import '../../../util/const/style/global_color.dart';
import '../../../provider/routes/routes.dart';
import '../controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( // Center the Column
        child: Column(
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
            naverLogin(),
            SizedBox(
              height: 12.h,
            ),
            appleLogin(),
            SizedBox(
              height: 30.h,
            ),
            mailLogin(),
          ],
        ),
      ),
    );
  }

  @override kakaoLogin() {
    return GestureDetector(
      onTap: () async {
        try {
          if (await isKakaoTalkInstalled()) {
            try {
              await UserApi.instance.loginWithKakaoTalk();
              print('카카오톡으로 로그인 성공');
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
                Get.toNamed(Routes.main);
              } catch (error) {
                print('카카오계정으로 로그인 실패 $error');
              }
            }
          } else {
            try {
              await UserApi.instance.loginWithKakaoAccount();
              print('카카오계정으로 로그인 성공');
            } catch (error) {
              print('카카오계정으로 로그인 실패 $error');
            }
          }
        } catch (error) {
          print('Kakao 로그인 실패: $error');
          if (error is PlatformException && error.code == 'CANCELED') {
            // 사용자가 KakaoTalk 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
            // 의도적인 로그인 취소로 간주하고 Kakao 계정 로그인을 시도하지 않음 (예: 뒤로 가기)
            return;
          }
        }
      },
      child: Container(
        width: 300.w,
        height: 46.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), // Set border radius to 10px
          color: AppColors.kakaoBtn, // Button's background color
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 24.w), // Add some spacing between the icon and text
            SvgPicture.asset(iconDir + "login/ic_kakao_19.svg"), // Include your SVG here
            SizedBox(width: 80.w), // Add some spacing between the icon and text
            Text(
              '카카오 로그인',
              style: AppTextStyles.subtitle2Bold14.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override naverLogin() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.home);
      },
      child: Container(
        width: 300.w,
        height: 46.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), // Set border radius to 10px
          color: AppColors.naverBtn, // Button's background color
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 24.w), // Add some spacing between the icon and text
            SvgPicture.asset(iconDir + "login/ic_naver_16.svg"), // Include your SVG here
            SizedBox(width: 80.w), // Add some spacing between the icon and text
            Text(
              '네이버 로그인',
              style: AppTextStyles.subtitle2Bold14.copyWith(fontWeight: FontWeight.w600, color: AppColors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override appleLogin() {
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
              style: AppTextStyles.subtitle2Bold14.copyWith(fontWeight: FontWeight.w600, color: AppColors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override mailLogin() {
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
                  style: AppTextStyles.body3Bold12.copyWith(fontWeight: FontWeight.w500, color: AppColors.grey4),
                ),
                TextSpan(
                  text: '이메일 로그인',
                  style: AppTextStyles.body3Bold12.copyWith(color: Colors.black)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}


/*child: GestureDetector(
onTap: () {
Get.toNamed(Routes.home);
},
child: Text('login'))*/
