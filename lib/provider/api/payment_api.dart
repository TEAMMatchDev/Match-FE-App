import 'package:dio/dio.dart';
import 'package:match/model/total_pay/total_pay.dart';

import '../../model/pay/pay.dart';
import '../../util/const/style/global_logger.dart';
import 'util/dio_services.dart';
import 'util/global_api_field.dart';

class PaymentApi {
  //TODO: pagination 적용
  ///<h2>5-5-2 API | 기부 리스트 조회</h2>
  static Future<List<TotalPay>> getProjectPayments({
    int page = 0,
    int size = 10,
  }) async {
    try {
      Response response = await DioServices().to().get("/donations",
          queryParameters: {"page": 0, "size": 10, "filter": 0});
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

  //TODO: pagination 적용
  ///<h2>5-8 API | 기부 리스트 조회</h2>
  static Future<List<Pay>> getPaymentDetail({
    required int regularPayId,
    int page = 0,
    int size = 10,
  }) async {
    try {
      Response response = await DioServices().to().get(
          "/donations/pay/${regularPayId}",
          queryParameters: {"page": 0, "size": 10, "filter": 0});
      // logger.d(response.data);
      return List.generate(
        response.data[RESULT].length,
        (index) => Pay.fromJson(response.data[RESULT][index]),
      );
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }
}
