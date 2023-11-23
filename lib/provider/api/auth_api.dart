import 'dart:ffi';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:match/modules/signUp/controller/signup_controller.dart';
import 'package:match/provider/api/util/global_api_field.dart';
import 'package:match/provider/service/auth_service.dart';
import '../../model/token/token.dart';
import '../../util/const/style/global_logger.dart';
import '../../util/method/get_storage.dart';
import 'util/dio_services.dart';

import 'package:match/model/user/user.dart';

class UserAuthApi {
  ///<h2>1-2API | 카카오 로그인 --카카오 토큰으로 access token 발급</h2>
  static Future<bool> setKakaoLogin({
    required String token,
  }) async {
    try {
      Response response = await DioServices()
          .to()
          .post("/auth/kakao", data: {"accessToken": token});
      logger.e(response.data["message"]);
      if (!response.data[SUCCESS]) {
        Fluttertoast.showToast(
            msg: response.data[MSG],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
        logger.e(response.data[CODE]);
      }
      saveToken(response.data[RESULT]);
      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  ///<h2>1-3API | 네이버 로그인</h2>
  static Future<bool> setNaverLogin({
    required String token,
  }) async {
    try {
      Response response = await DioServices()
          .to()
          .post("/auth/naver", data: {"accessToken": token});
      logger.e(response.data["message"]);

      if (!response.data[SUCCESS]) {
        Fluttertoast.showToast(
            msg: response.data[MSG],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
        logger.e(response.data[CODE]);
      }

      String accessToken = response.data[RESULT]["accessToken"];
      DioServices().setAccessToken(accessToken);

      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  ///<h2>1-11API | 애플 로그인</h2>
  static Future<bool> setAppleLogin({
    required String accessToken,
  }) async {
    try {
      Response response = await DioServices()
          .to()
          .post("/auth/apple", data: {"accessToken": accessToken});

      if (response.data[SUCCESS]) {
        print(
            ">>> (애플로그인) 사용자의 accessToken: ${response.data[RESULT]["accessToken"]}");
        String token = response.data[RESULT]["accessToken"];
        DioServices().setAccessToken(token);

      }

      return true;
    } catch (e) {
      logger.e(">> 애플로그인 시도: ${e.toString()}");
      if (e is DioError && e.response != null) {
        SignUpController signUpController = Get.find();
        final errorData = e.response!.data;
        if (errorData[RESULT] != null &&
            errorData[RESULT]['socialId'] != null) {
          var socialId = errorData[RESULT]['socialId'];
          if (socialId.startsWith('"') && socialId.endsWith('"')) {
            socialId = socialId.substring(1, socialId.length - 1);
          }

          User user = User(socialId: socialId, email: '', gender: '');

          signUpController.socialId.value = socialId;
          print(">>> 애플로그인 시도할 socialId: ${socialId}");
          print(">>> 애플로그인 시도할 socialId: ${user.socialId}");
          print(">>> 애플로그인 시도할 socialId: ${signUpController.socialId.value}");
        }
      } else {
        Fluttertoast.showToast(msg: "애플 로그인 실패");
      }
      return false;
    }
  }

  ///<h2>1-11-1API 애플 회원가입</h2>
  static Future<bool> setAppleSignUp({
    required String socialId,
    required String email,
    required String name,
    required String phone,
    required String gender,
    required String birthDate,
  }) async {
    try {
      Response response =
          await DioServices().to().post("/auth/apple/sign-up", data: {
        "socialId": socialId,
        "email": email,
        "name": name,
        "phone": phone,
        "gender": gender,
        "birthDate": birthDate
      });

      if (!response.data[SUCCESS]) {
        Fluttertoast.showToast(
            msg: response.data[MSG],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
        logger.e(response.data[CODE]);
      }

      saveToken(response.data[RESULT]);
      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  ///<h2>1-6API | 유저 로그인</h2>
  static Future<bool> setSignIn({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await DioServices()
          .to()
          .post("/auth/logIn", data: {"email": email, "password": password});

      if (!response.data[SUCCESS]) {
        Fluttertoast.showToast(
            msg: response.data[MSG],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
        logger.e(response.data[CODE]);
      }
      logger.e(response.data[RESULT]);
      logger.i(
          '>>> 로그인 성공 후 사용자의 accessToken: ${response.data[RESULT]["accessToken"]}');
      saveToken(response.data[RESULT]);
      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  ///<h2>1-7API | 유저 이메일 인증번호 요청</h2>
  static Future<bool> getEmailAuth({
    required String email,
  }) async {
    try {
      Response response =
          await DioServices().to().get("/auth/email", queryParameters: {
        "email": email,
      });

      if (!response.data[SUCCESS]) {
        Fluttertoast.showToast(
            msg: response.data[MSG],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
      }

      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  ///<h2>1-8API | 유저 이메일 인증번호 확인</h2>
  static Future<bool> postAuthCheckEmail({
    required String email,
    required String code,
  }) async {
    try {
      Response response = await DioServices()
          .to()
          .post("/auth/check/email", data: {"email": email, "code": code});

      if (!response.data[SUCCESS]) {
        Fluttertoast.showToast(
            msg: response.data[MSG],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
      }

      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  ///<h2>1-9API | 유저 회원 문자 인증번호 요청</h2>
  static Future<bool> getPhoneAuth({
    required String phone,
  }) async {
    try {
      Response response =
          await DioServices().to().get("/auth/phone", queryParameters: {
        "phone": phone,
      });

      if (!response.data[SUCCESS]) {
        Fluttertoast.showToast(
            msg: response.data[MSG],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
      }

      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  ///<h2>1-10API | 유저 전화번호 인증번호 확인</h2>
  static Future<bool> postAuthCheckPhone({
    required String phone,
    required String code,
  }) async {
    try {
      Response response = await DioServices()
          .to()
          .post("/auth/check/phone", data: {"phone": phone, "code": code});

      if (!response.data[SUCCESS]) {
        Fluttertoast.showToast(
            msg: response.data[MSG],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
      }

      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  ///<h2>1-5-1API | 유저 회원가입 이메일 검증</h2>
  static Future<bool> postValidCheckEmail({
    required String email,
  }) async {
    try {
      Response response =
          await DioServices().to().post("/auth/email", data: {"email": email});

      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      if (e is DioError && e.response != null) {
        final errorData = e.response!.data;
        Fluttertoast.showToast(msg: errorData[MSG]);
      }
      return false;
    }
  }

  ///<h2>1-5-2API | 유저 회원가입 전화번호 검증</h2>
  static Future<bool> postValidCheckPhone({
    required String phone,
  }) async {
    try {
      Response response =
          await DioServices().to().post("/auth/phone", data: {"phone": phone});

      if (!response.data[SUCCESS]) {
        Fluttertoast.showToast(
            msg: response.data[MSG],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
      }

      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  ///<h2>1-5API | 유저 회원가입</h2>
  static Future<bool> setSignUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String gender,
    required String birthDate,
  }) async {
    try {
      Response response = await DioServices().to().post("/auth/user", data: {
        "email": email,
        "password": password,
        "name": name,
        "phone": phone,
        "gender": gender,
        "birthDate": birthDate
      });

      if (!response.data[SUCCESS]) {
        Fluttertoast.showToast(
            msg: response.data[MSG],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
      }
      saveToken(response.data[RESULT]);

      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  ///<h2>1-14API | 비밀번호 찾기용 이메일 전송  -> 1-8 다시 인증 -> 1-13 변경요청</h2>
  static Future<bool> sendSearchPwEmail({
    required String email,
  }) async {
    try {
      Response response = await DioServices()
          .to()
          .post("/auth/password/email", queryParameters: {"email": email});

      if (!response.data[SUCCESS]) {
        Fluttertoast.showToast(
            msg: response.data[MSG],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
      }

      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  ///<h2>1-13API | 비밀번호 변경</h2>
  static Future<bool> modifyPw({
    required String email,
    required String code,
    required String modifyPassword,
  }) async {
    try {
      Response response =
          await DioServices().to().post("/auth/password", data: {
        "email": email,
        "code": code,
        "modifyPassword": modifyPassword,
      });

      if (!response.data[SUCCESS]) {
        Fluttertoast.showToast(
            msg: response.data[MSG],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
      }

      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }
}

///* 토큰 정보 저장
Future<void> saveToken(Map<String, dynamic> json) async {
  Token token = Token.fromJson(json);
  GetStorageUtil.addToken(StorageKey.REFRESH_TOKEN, token.refreshToken);
  GetStorageUtil.addToken(StorageKey.ACCESS_TOKEN, token.accessToken);
  DioServices().setAccessToken(token.accessToken);
  //튜토리얼 진행여부 저장
  // AuthService.to.isTutorial.value = token.isTutorial;
  AuthService.to.isTutorial.value = true;
}
