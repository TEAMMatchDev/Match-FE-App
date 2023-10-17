import 'package:dio/dio.dart';
import 'package:match/provider/api/util/global_api_field.dart';

import '../../model/api/pagination.dart';
import '../../model/flame/flame.dart';
import '../../util/const/style/global_logger.dart';
import 'util/dio_services.dart';

class FlameApi {
  ///* flameList pagination 추가 호출 판별 함수
  static Pagination burningFlame = Pagination(isLast: false, totalPage: 0);

  ///<h2>5-12 API | 홈 - 고유 불꽃이 조회</h2>
  static Future<List<Flame>> getBurningFlameList({bool getMore = false}) async {
    try {
      //호출횟수에 따라 currentPage 증가
      if (getMore) {
        burningFlame.currentpage++;
      } else {
        //최초 호출이면 currentPage 초기화
        burningFlame.currentpage = 0;
      }

      Response response = await DioServices()
          .to()
          .get("/donations/burning-flame", queryParameters: {
        "page": burningFlame.currentpage,
        "size": PAGINATION_SIZE
      });

      burningFlame.totalPage = response.data[RESULT][TOTAL] ~/ PAGINATION_SIZE;
      burningFlame.isLast = response.data[RESULT][LAST];

      return List.generate(response.data[RESULT][CONTENTS].length,
          (index) => Flame.fromJson(response.data[RESULT][CONTENTS][index]));
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }
}
