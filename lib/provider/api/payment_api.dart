import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:match/model/total_pay/total_pay.dart';

import '../../model/api/pagination.dart';
import '../../model/pay/pay.dart';
import '../../util/const/style/global_logger.dart';
import 'util/dio_services.dart';
import 'util/global_api_field.dart';

class PaymentApi {
  ///<h2>5-11 API | 진행중인 매치 결제내역 조회</h2>
  ///pagination 적용
  static Pagination matchPays = Pagination(isLast: false, totalCnt: 0);

  static Future<List<TotalPay>> getProjectPayments({
    bool getMore = false,
  }) async {
    try {
      if (!getMore) {
        matchPays.currentpage = 0;
      } else {
        matchPays.currentpage += 1;
      }
      var queryParameters = {
        "page": matchPays.currentpage,
        "size": PAGINATION_SIZE,
      };
      Response response = await DioServices()
          .to()
          .get("/donations/match", queryParameters: queryParameters);
      logger.d(response.data);
      return List.generate(
        response.data[RESULT][CONTENTS].length,
        (index) => TotalPay.fromJson(response.data[RESULT][CONTENTS][index]),
      );
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }

  ///<h2>5-8 API | 기부 리스트 조회</h2>
  static Future<List<Pay>> getPaymentDetail({
    required int regularPayId,
  }) async {
    try {
      Response response = await DioServices().to().get(
            "/donations/pay/$regularPayId",
          );
      logger.d(response.data);
      return List.generate(
        response.data[RESULT].length,
        (index) => Pay.fromJson(response.data[RESULT][index]),
      );
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }

  ///<h2>05-04 API | 정기 기부 해제</h2>
  static Future<bool> deleteDonate({required int regularId}) async {
    try {
      Response response =
          await DioServices().to().delete("/donations/$regularId");
      if (!response.data[SUCCESS]) {
        Fluttertoast.showToast(msg: response.data[MSG]);
      }
      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }
}
