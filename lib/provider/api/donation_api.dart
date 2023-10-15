import 'package:dio/dio.dart';

import '../../model/match_history/match_history.dart';
import '../../util/const/style/global_logger.dart';
import 'util/dio_services.dart';
import 'util/global_api_field.dart';

class DonationApi {
  static bool getDonationHistoryIsLast = false;

  //TODO: donationID가 존재하지않을때 404 에러 핸들링
  ///<h2>3-9 API | 프로젝트 매치 기록 조회</h2>
  static Future<List<MatchHistory>> getDonationHistory({
    required int donationId,
    int page = 0,
  }) async {
    try {
      Response response = await DioServices().to().get(
          "/donations/flame/bottom/${donationId}",
          queryParameters: {"page": page, "size": 10});
      getDonationHistoryIsLast = response.data[RESULT][LAST];
      return List.generate(
          response.data[RESULT][CONTENTS].length,
          (index) =>
              MatchHistory.fromJson(response.data[RESULT][CONTENTS][index]));
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }
}
