import 'package:dio/dio.dart';
import 'package:match/model/match_history/match_history.dart';
import 'package:match/provider/api/util/global_api_field.dart';

import '../../model/api/pagination.dart';
import '../../model/flame/flame.dart';
import '../../model/flame_detail/flame_detail.dart';
import '../../util/const/style/global_logger.dart';
import 'util/dio_services.dart';

class FlameApi {
  ///* flameList pagination 추가 호출 판별 변수
  static Pagination burningFlame = Pagination(isLast: false, totalCnt: 0);
  static Pagination detailFlameBottom = Pagination(isLast: false, totalCnt: 0);

  ///<h2>5-12 API | 홈 - 고유 불꽃이 조회</h2>
  ///* pagination
  static Future<List<Flame>> getBurningFlameList({bool getMore = false}) async {
    try {
      if (!getMore) {
        burningFlame.currentpage = 0;
      } else {
        burningFlame.currentpage += 1;
      }
      Response response = await DioServices()
          .to()
          .get("/donations/burning-flame", queryParameters: {
        "page": burningFlame.currentpage,
        "size": PAGINATION_SIZE
      });

      burningFlame.totalCnt = response.data[RESULT][TOTAL];
      burningFlame.isLast = response.data[RESULT][LAST];
      logger.d(
          "pagination 정보: totalCnt:${burningFlame.totalCnt}, currentPage:${burningFlame.currentpage} isLast:${burningFlame.isLast}");
      return List.generate(response.data[RESULT][CONTENTS].length,
          (index) => Flame.fromJson(response.data[RESULT][CONTENTS][index]));
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }

  ///<h2>5-10-1 API | 상세 - 불타는 매치 상세 - 상단조회</h2>
  static Future<FlameDetail?> getDetailFlameTop(
      {required int donationId}) async {
    try {
      logger.d("api호출 성공");
      Response response =
          await DioServices().to().get("/donations/flame/top/$donationId");

      return FlameDetail.fromJson(response.data[RESULT]);
    } catch (e) {
      logger.e(e.toString());
    }
  }

  ///<h2>5-10-2 API | 상세 - 불타는 매치 상세 - 하단조회</h2>
  ///* pagination
  static Future<List<MatchHistory>> getFlameDetailBottomList(
      {required int donationId, bool getMore = false}) async {
    try {
      logger.d("api호출 성공");
      if (!getMore) {
        detailFlameBottom.currentpage = 0;
      } else {
        detailFlameBottom.currentpage += 1;
      }
      Response response = await DioServices()
          .to()
          .get("/donations/flame/bottom/$donationId", queryParameters: {
        "page": detailFlameBottom.currentpage,
        "size": PAGINATION_SIZE
      });

      detailFlameBottom.totalCnt = response.data[RESULT][TOTAL];
      detailFlameBottom.isLast = response.data[RESULT][LAST];
      logger.d(
          "pagination 정보: totalCnt:${detailFlameBottom.totalCnt}, currentPage:${detailFlameBottom.currentpage} isLast:${detailFlameBottom.isLast}");
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
