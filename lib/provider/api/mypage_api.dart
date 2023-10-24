import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:match/provider/api/util/global_api_field.dart';

import '../../model/banner/banners.dart';
import '../../model/profile/profile.dart';
import '../../util/const/style/global_logger.dart';
import 'util/dio_services.dart';

class MypageApi {
  ///<h2>2-2API | 프로필 정보 조회</h2>
  static Future<Profile?> getProfile() async {
    try {
      Response response = await DioServices().to().get("/users/profile");

      return Profile.fromJson(response.data[RESULT]);
    } catch (e) {
      logger.e(e.toString());
    }
  }

  ///<h2>6-2API | 닉네임 변경 </h2>
  static Future<bool> setNickname({required String nickName}) async {
    try {
      Response response = await DioServices().to().patch(
        "/users/profile",
        data: {"name": nickName, "multipart": null},
      );
      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  ///<h2> 1-9 API |  핸드폰 번호 인증</h2>
  static Future<bool> getPhoneValidCode({required String phone}) async {
    try {
      Response response = await DioServices()
          .to()
          .get("/auth/phone", queryParameters: {"phone": phone});
      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  ///<h2> 1-10 API |  인증코드 확인 API </h2>
  static Future<bool> checkCodeWithPhone({
    required String code,
    required String phone,
  }) async {
    try {
      Response response = await DioServices()
          .to()
          .post("/auth/check/phone", data: {"phone": phone, "code": code});
      if (!response.data[SUCCESS]) {
        Fluttertoast.showToast(msg: response.data[MSG]);
        logger.e(response.data[CODE]);
      }
      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  ///<h2> 2-8 2API |  핸드폰 번호 변경 </h2>
  static Future<bool> setPhone({
    required String oldPhone,
    required String newPhone,
  }) async {
    try {
      Response response = await DioServices().to().post("/users/phone",
          data: {"oldPhone": oldPhone, "newPhone": newPhone});
      if (!response.data[SUCCESS]) {
        Fluttertoast.showToast(msg: response.data[MSG]);
        logger.e(response.data[CODE]);
      }
      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }
}
