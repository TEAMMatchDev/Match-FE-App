import 'package:dio/dio.dart';
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
      Response response = await DioServices()
          .to()
          .patch("/users/profile", data: {"name": nickName},
          options: Options(contentType: 'multipart/form-data'));
      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  ///<h2> 2-8 2API |  핸드폰 번호 변경 </h2>
  static Future<bool> setPhone(
      {required String oldPhone, required String newPhone,}) async {
    try {
      Response response = await DioServices()
          .to()
          .patch(
          "/users/phone", data: {"oldPhone": oldPhone,"newPhone": newPhone});
      return response.data[SUCCESS];
      } catch (e)
      {
        logger.e(e.toString());
        return false;
      }
    }
  }
