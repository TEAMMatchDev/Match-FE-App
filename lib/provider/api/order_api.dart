import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:match/model/donator/donator.dart';
import 'package:match/provider/api/util/global_api_field.dart';

import '../../util/const/style/global_logger.dart';
import 'util/dio_services.dart';

class OrderApi {

  ///<h2>4-7API | 후원자 정보 조회</h2>
  static Future<Donator?> getProfile() async {
    try {
      Response response = await DioServices().to().post("/order/user");

      var data = response.data[RESULT];

      if (data['name'] != null && data['birthDay'] != null && data['phoneNumber'] != null) {
        return Donator.fromJson(response.data[RESULT]);
      } else {
        logger.e("response 값이 아무것도 담겨있지 않습니다.");
        return null;
      }

    } catch (e) {
      logger.e(e.toString());
    }
  }


}