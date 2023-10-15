import 'package:dio/dio.dart';
import 'package:match/model/total_pay/total_pay.dart';

import '../../util/const/style/global_logger.dart';
import 'util/dio_services.dart';
import 'util/global_api_field.dart';

class PaymentApi {
  ///<h2>5-5-2 API | 기부 리스트 조회</h2>
  //TODO: pagination 적용
  static Future<List<TotalPay>> getProjectList() async {
    try {
      Response response = await DioServices().to().get("/projects/list",
          queryParameters: {"page": 0, "size": 10, "filter": 0});
      // logger.d(response.data);
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
  //TODO: pagination 적용
  static Future<List<TotalPay>> getPaymentDetail(
      {required int regularPayId}) async {
    try {
      Response response = await DioServices().to().get(
          "/donations/pay/${regularPayId}",
          queryParameters: {"page": 0, "size": 10, "filter": 0});
      // logger.d(response.data);
      return List.generate(
        response.data[RESULT][CONTENTS].length,
        (index) => TotalPay.fromJson(response.data[RESULT][CONTENTS][index]),
      );
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }
}
