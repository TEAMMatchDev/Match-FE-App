import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:match/provider/api/util/global_api_field.dart';
import '../../util/const/style/global_logger.dart';
import 'util/dio_services.dart';

import 'package:match/model/user/user.dart';

class UserAuthApi {

  ///<h2>1-6API | 유저 로그인</h2>
  static Future<bool> setSignIn({
    required String email,
    required String password,
}) async {
    try {
      Response response = await DioServices().to().post("/auth/logIn",
          data: {"email": email, "password": password});

      if(!response.data[SUCCESS]) {
        Fluttertoast.showToast(msg: response.data[MSG]);
        logger.e(response.data[CODE]);
      }

      DioServices().tmpToken = response.data[RESULT]["accessToken"];

      return response.data[SUCCESS];
    } catch(e){
      logger.e(e.toString());
      return false;
    }
  }




}
