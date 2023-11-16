import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:match/model/enum/login_type.dart';
import 'package:match/modules/signIn/controller/login_controller.dart';
import 'package:match/provider/api/auth_api.dart';
import 'package:match/provider/routes/routes.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

class KakaoLoginWidget extends StatefulWidget {
  final LoginController loginController = Get.find<LoginController>();

  @override
  _KakaoLoginState createState() => _KakaoLoginState();
}

class _KakaoLoginState extends State<KakaoLoginWidget> {
  LoginController controller = Get.find<LoginController>();
  bool _isKakaoTalkInstalled = true;
  var validateToken;

  @override
  void initState() {
    super.initState();
    _initKakaoTalkInstalled();
  }

  void _initKakaoTalkInstalled() async {
    final installed = await isKakaoTalkInstalled();
    print('>> 카카오톡 Install: ' + installed.toString());

    setState(() {
      _isKakaoTalkInstalled = installed;
    });
  }

  void signInWithKakao() async {
    try {
      if (await isKakaoTalkInstalled()) {
        /// 카카오톡이 설치 되어있는 경우
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
          print('카카오톡으로 로그인 성공 (by.앱) ${token.accessToken}');

          //TODO) setKakaoLogin 호출
          var result = await UserAuthApi.setKakaoLogin(token: token.accessToken);
          if(result) {
            controller.setPlatform('kakao');
            print(">> 로그인한 플랫폼: ${controller.loginPlatform}");
            Get.offAllNamed(Routes.main);
          } else {
            Fluttertoast.showToast(msg: "로그인에 실패했습니다.");
          }
        } catch (error) {
          print('카카오톡으로 로그인 실패 1) $error');

          // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
          // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
          if (error is PlatformException && error.code == 'CANCELED') {
            return;
          }
          // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
          try {
            OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
            print('카카오계정으로 로그인 성공 ${token.accessToken}');

            //TODO) setKakaoLogin 호출
            var result = await UserAuthApi.setKakaoLogin(token: token.accessToken);
            if(result) {
              controller.setPlatform('kakao');
              print(">> 로그인한 플랫폼: ${controller.loginPlatform}");
              Get.offAllNamed(Routes.main);
            } else {
              Fluttertoast.showToast(msg: "로그인에 실패했습니다.");
            }

          } catch (error) {
            print('카카오계정으로 로그인 실패 1) $error');
          }
        }
      }
      else {
        /// 카카오톡 미설치 경우
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          print('카카오톡으로 로그인 성공 (by.웹뷰) ${token.accessToken}');

          //TODO) setKakaoLogin 호출
          var result = await UserAuthApi.setKakaoLogin(token: token.accessToken);
          if(result) {
            controller.setPlatform('kakao');
            print(">> 로그인한 플랫폼: ${controller.loginPlatform}");
            Get.offAllNamed(Routes.main);
          } else {
            Fluttertoast.showToast(msg: "로그인에 실패했습니다.");
          }

        } catch (error) {
          print('카카오계정으로 로그인 실패 2) $error');
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
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        signInWithKakao();
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
            SizedBox(width: 28.w),
            Text(
              '카카오로 로그인하고 시작하기',
              style:
              AppTextStyles.T1Bold14.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

}