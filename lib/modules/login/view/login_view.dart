import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      body: Center(
        // Center the Column
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center the children vertically
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

  @override
  kakaoLogin() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.home);
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
            SvgPicture.asset(
                iconDir + "login/ic_kakao_19.svg"), // Include your SVG here
            SizedBox(width: 80.w), // Add some spacing between the icon and text
            Text(
              '카카오 로그인',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Apple SD Gothic Neo',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  naverLogin() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.main);
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
            SvgPicture.asset(
                iconDir + "login/ic_naver_16.svg"), // Include your SVG here
            SizedBox(width: 80.w), // Add some spacing between the icon and text
            Text(
              '네이버 로그인',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Apple SD Gothic Neo',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  appleLogin() {
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
            SvgPicture.asset(
                iconDir + "login/ic_apple_20.svg"), // Include your SVG here
            SizedBox(width: 80.w), // Add some spacing between the icon and text
            Text(
              '애플 로그인',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Apple SD Gothic Neo',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  mailLogin() {
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
                  style: TextStyle(
                    color: AppColors.grey4,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Apple SD Gothic Neo',
                  ),
                ),
                TextSpan(
                  text: '이메일 로그인',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Apple SD Gothic Neo',
                    decoration: TextDecoration.underline,
                  ),
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
