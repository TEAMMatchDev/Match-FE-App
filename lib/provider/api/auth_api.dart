import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:match/provider/api/util/global_api_field.dart';
import '../../util/const/style/global_logger.dart';
import 'util/dio_services.dart';

import 'package:match/model/user/user.dart';

class UserAuthApi {

  ///<h2>1-2API | 카카오 로그인 --카카오 토큰으로 access token 발급</h2>
  static Future<bool> setKakaoLogin({
    required String token,
}) async {
    try {
      Response response = await DioServices().to().post("/auth/kakao",
        data: {"accessToken": token});

      if(!response.data[SUCCESS]) {
        Fluttertoast.showToast(
            msg: response.data[MSG],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1
        );
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

  ///<h2>1-6API | 유저 로그인</h2>
  static Future<bool> setSignIn({
    required String email,
    required String password,
}) async {
    try {
      Response response = await DioServices().to().post("/auth/logIn",
          data: {"email": email, "password": password});

      if(!response.data[SUCCESS]) {
        Fluttertoast.showToast(
          msg: response.data[MSG],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1
        );
        logger.e(response.data[CODE]);
      }

      logger.i('>>> 로그인 성공 후 사용자의 accessToken: ${response.data[RESULT]["accessToken"]}');
      String accessToken = response.data[RESULT]["accessToken"];
      DioServices().setAccessToken(accessToken);

      return response.data[SUCCESS];
    } catch(e){
      logger.e(e.toString());
      return false;
    }
  }

///<h2>1-7API | 유저 이메일 인증번호 요청</h2>
static Future<bool> getEmailAuth({
    required String email,
}) async {
    try {
      Response response = await DioServices().to().get("/auth/email",
          queryParameters: {
            "email": email,
          });

      if(!response.data[SUCCESS]) {
        Fluttertoast.showToast(
            msg: response.data[MSG],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1
        );
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
      Response response = await DioServices().to().post("/auth/check/email",
          data: {"email": email, "code": code});

      if(!response.data[SUCCESS]) {
        Fluttertoast.showToast(
            msg: response.data[MSG],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1
        );
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
    Response response = await DioServices().to().get("/auth/phone",
        queryParameters: {
          "phone": phone,
        });

    if(!response.data[SUCCESS]) {
      Fluttertoast.showToast(
          msg: response.data[MSG],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1
      );
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
      Response response = await DioServices().to().post("/auth/check/phone",
          data: {"phone": phone, "code": code});

      if(!response.data[SUCCESS]) {
        Fluttertoast.showToast(
            msg: response.data[MSG],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1
        );
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
      Response response = await DioServices().to().post("/auth/email",
          data: {"email": email});

      if(!response.data[SUCCESS]) {
        Fluttertoast.showToast(
            msg: response.data[MSG],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1
        );
      }

      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
}

///<h2>1-5-2API | 유저 회원가입 전화번호 검증</h2>
static Future<bool> postValidCheckPhone({
    required String phone,
}) async {
    try {
      Response response = await DioServices().to().post("/auth/phone",
          data: {"phone": phone});

      if(!response.data[SUCCESS]) {
        Fluttertoast.showToast(
            msg: response.data[MSG],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1
        );
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
      Response response = await DioServices().to().post("/auth/user",
        data: {"email": email, "password": password, "name": name, "phone": phone, "gender": gender, "birthDate": birthDate});

      if(!response.data[SUCCESS]) {
        Fluttertoast.showToast(
            msg: response.data[MSG],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1
        );
      }

      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
}

}
