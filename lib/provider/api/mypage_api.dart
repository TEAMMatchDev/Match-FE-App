import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:match/model/today_project/today_project.dart';
import 'package:match/provider/api/util/global_api_field.dart';
import 'package:match/util/method/get_storage.dart';

import '../../model/api/pagination.dart';
import '../../model/banner/banners.dart';
import '../../model/profile/profile.dart';
import '../../util/const/style/global_logger.dart';
import 'util/dio_services.dart';

class MypageApi {
  ///<h2>2-2API | 프로필 정보 조회</h2>
  static Future<Profile?> getProfile() async {
    try {
      Response response = await DioServices().to().get("/users/profile");
      logger.i(">>> 마이페이지 프로필 정보 조회: ${response}");

      return Profile.fromJson(response.data[RESULT]);
    } catch (e) {
      logger.e(e.toString());
    }
  }

  ///<h2>6-2API | 닉네임 변경 </h2>
  static Future<bool> setNickname({required String nickName}) async {
    try {
      FormData formData = FormData.fromMap({
        "name": nickName,
      });

      Response response =
          await DioServices().to().patch("/users/profile", data: formData);

      if (!response.data[SUCCESS]) {
        Fluttertoast.showToast(msg: response.data[MSG]);
      }
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
      if (!response.data[SUCCESS]) {
        Fluttertoast.showToast(msg: response.data[MSG]);
      }
      return response.data[SUCCESS];
    } catch (e) {
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

  ///<h2>2-4 API | 로그아웃 ; 알림 device ID 제거</h2>
  static Future<bool> logout() async {
    try {
      var deviceId = await GetStorageUtil.getToken(StorageKey.DEVICE_ID);
      logger.e(deviceId);
      DioServices().addHeader("DEVICE_ID", deviceId ?? "");
      Response response = await DioServices().to().get(
        "/users/logout",
        queryParameters: {"DEVICE_ID": deviceId},
      );
      if (response.data[SUCCESS]) {
        DioServices().removeHeader('DEVICE_ID');
      }
      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e);
      Fluttertoast.showToast(msg: "로그아웃에 실패하였습니다. ${e}");
      return false;
    }
  }

  ///<h2>2-12 API | 회원탈퇴</h2>
  static Future<bool> signOut() async {
    try {
      Response response = await DioServices().to().delete(
            "/users",
          );
      return response.data[SUCCESS];
    } catch (e) {
      Fluttertoast.showToast(msg: "회원탈퇴에 실패하였습니다. ${e}");
      return false;
    }
  }

  ///<h2>2-13 API | 회원탈퇴</h2>
  static Future<bool> signOutApple({required String code}) async {
    try {
      Response response =
          await DioServices().to().delete("/users/apple", data: {"code": code});

      return response.data[SUCCESS];
    } catch (e) {
      Fluttertoast.showToast(msg: "회원탈퇴에 실패하였습니다. ${e}");
      return false;
    }
  }

  ///* 3-5 pagination 추가 호출 판별 함수
  static Pagination likes = Pagination(isLast: false, totalCnt: 0);

  ///<h2>3-13API | 내가 찜한 기부처 모아보기 </h2>
  static Future<List<TodayProject>> getLikeList({
    bool getMore = false,
  }) async {
    try {
      if (!getMore) {
        likes.currentpage = 0;
      } else {
        likes.currentpage += 1;
      }
      var queryParameters = {
        "page": likes.currentpage,
        "size": PAGINATION_SIZE,
        "filter": "LATEST",
      };
      Response response = await DioServices()
          .to()
          .get("/projects/like", queryParameters: queryParameters);

      likes.totalCnt = response.data[RESULT][TOTAL];
      likes.isLast = response.data[RESULT][LAST];
      logger.d(
          "pagination 정보: totalCnt:${likes.totalCnt}, currentPage:${likes.currentpage} isLast:${likes.isLast}");

      return List.generate(
        response.data[RESULT][CONTENTS].length,
        (index) =>
            TodayProject.fromJson(response.data[RESULT][CONTENTS][index]),
      );
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }
}
