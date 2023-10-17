import 'package:dio/dio.dart';
import 'package:match/provider/api/util/global_api_field.dart';

import '../../model/api/pagination.dart';
import '../../model/flame/flame.dart';
import '../../util/const/style/global_logger.dart';
import 'util/dio_services.dart';

class FlameApi {
  ///* flameList pagination 추가 호출 판별 함수
  static Pagination burningFlame = Pagination(isLast: false, totalCnt: 0);

  ///<h2>5-12 API | 홈 - 고유 불꽃이 조회</h2>
  static Future<List<Flame>> getBurningFlameList({bool getMore = false}) async {
    try {
      logger.d("api호출 성공");
      if (!getMore) {
        burningFlame.currentpage = 0;
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
}
