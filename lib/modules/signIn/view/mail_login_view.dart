import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match/model/enum/login_type.dart';
import 'package:match/model/enum/search_status.dart';
import 'package:match/modules/signIn/view/find_pw_view.dart';
import 'package:match/modules/signIn/view/login_view.dart';
import 'package:match/modules/signUp/view/signup_user_mail_view.dart';
import 'package:match/modules/signIn/widget/login_widget.dart';
import 'package:match/modules/main/view/main_view.dart';
import 'package:match/util/components/gloabl_text_field.dart';
import 'package:match/util/components/global_button.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import '../../../provider/service/auth_service.dart';
import '../../../util/components/global_app_bar.dart';
import '../../../util/const/style/global_color.dart';

import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart'; //카카오 로그인

import 'package:match/provider/api/auth_api.dart';

import '../../../provider/routes/routes.dart';
import '../../tutorial/view/init_tutorial_view.dart';
import '../controller/login_controller.dart';

class EmailLoginScreen extends GetView<LoginController> {
  const EmailLoginScreen({super.key});

  bool isEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    String logintype = 'NOMAL';
    return Scaffold(
      appBar: CommonAppBar.basic("로그인"),
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
                      Text(
                        '이메일',
                        style: AppTextStyles.T1Bold14,
                      ),
                      SizedBox(height: 10.h),
                      //TODO) api 연동
                      CommonInputField.signInID(
                          textController: controller.idTextController.value,
                          onChange: (value) async {
                            //print(">>> 입력한 id: $value");
                            controller.userId.value = value;
                          }),
                      SizedBox(height: 20.h),
                      Text(
                        '비밀번호',
                        style: AppTextStyles.T1Bold14,
                      ),
                      SizedBox(height: 10.h),
                      CommonInputField.signInPW(
                          textController: controller.pwTextController.value,
                          onChange: (value) async {
                            //print(">>> 입력한 pw: $value");
                            controller.userPw.value = value;
                          }),
                      SizedBox(height: 27.h),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(SignUpMailScreen());
                              },
                              child: Text(
                                "회원가입",
                                style: AppTextStyles.T1Bold12.copyWith(
                                    color: AppColors.grey6),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              "|",
                              style: AppTextStyles.T1Bold12.copyWith(
                                  color: AppColors.grey1),
                            ),
                            SizedBox(width: 10.w),
                            GestureDetector(
                              onTap: () {
                                Get.to(FindPwScreen());
                              },
                              child: Text(
                                "비밀번호 찾기",
                                style: AppTextStyles.T1Bold12.copyWith(
                                    color: AppColors.grey6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CommonButton.login(
              text: "로그인",
              onTap: () async {
                if (controller.userId.value != '' &&
                    controller.userPw.value != '') {
                  ///이메일 유효성 검사
                  bool isValidEmail = isEmail(controller.userId.value);
                  if (isValidEmail) {
                    var result = await UserAuthApi.setSignIn(
                        email: controller.userId.value,
                        password: controller.userPw.value);
                    if (result) {
                      controller.setPlatform('email');
                      //print(">> 로그인한 플랫폼: ${controller.loginPlatform}");
                      if(AuthService.to.isTutorial.value) {
                      await AuthService.to.getUserInfo();
                      Get.to(() => const InitTutorialScreen());
                      }
                      else {
                        Get.offAllNamed(Routes.main);
                      }
                    } else {
                      Fluttertoast.showToast(msg: "로그인에 실패했습니다.");
                    }
                  } else {
                    Fluttertoast.showToast(msg: "이메일 형식을 다시 확인해주세요");
                  }
                } else {
                  //아이디 비밀번호 둘 중 하나 ''ㄴ
                  Fluttertoast.showToast(msg: "아이디와 비밀번호를 입력해주세요.");
                }
              },
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

}



/*child: GestureDetector(
onTap: () {
Get.toNamed(Routes.home);
},
child: Text('login'))*/
