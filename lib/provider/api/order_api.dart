import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:match/model/card_info/card_info.dart';
import 'package:match/model/donator/donator.dart';
import 'package:match/provider/api/util/global_api_field.dart';

import '../../util/const/style/global_logger.dart';
import 'util/dio_services.dart';

class OrderApi {
  ///<h2>4-2API | 정기 결제용 카드 등록</h2>
  static Future<bool> setCard({
    required String cardNo,
    required String expYear,
    required String expMonth,
    required String idNo,
    required String cardPw,
}) async {
    try {
      Response response = await DioServices().to().post("/order/pay/card",
          data: {"cardNo": cardNo, "expYear": expYear, "expMonth": expMonth, "idNo": idNo, "cardPw": cardPw});
      if(!response.data[SUCCESS]) {
        Fluttertoast.showToast(msg: response.data[MSG]);
        logger.e(response.data[CODE]);
      }
      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

///<h2>4-5API | 정기 결제 등록</h2>
  static Future<bool> setRegularPay({
    required int cardId,
    required int projectId,
    required int amount,
    required int payDate,
}) async {
    try {
      Response response = await DioServices().to().post("/order/pay/card/${cardId}/${projectId}",
          data: {"amount": amount, "payDate": payDate});

      if(!response.data[SUCCESS]) {
        Fluttertoast.showToast(msg: response.data[MSG]);
        logger.e(response.data[CODE]);
      }
      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  ///<h2>4-3API | 정기 결제용 카드 조회</h2>
  static Future<List<CardInfo>> getCardList() async {
    try {
      Response response = await DioServices().to().get("/order/pay/card");
      var data = response.data[RESULT];

      if(data != null) {
        return List.generate(
          response.data[RESULT].length,
              (index) => CardInfo.fromJson(response.data[RESULT][index]),
        );
      }
      else {
        logger.e("response 값이 아무것도 담겨있지 않습니다.");
        return [];
      }
    } catch (e) {
      logger.e('>>> 카드 조회 실패: ${e.toString()}');
      return [];
    }
  }

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
