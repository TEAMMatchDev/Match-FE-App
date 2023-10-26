import 'package:dio/dio.dart';
import 'package:match/provider/api/util/dio_services.dart';
import 'package:match/provider/api/util/global_api_field.dart';

import '../../model/api/pagination.dart';
import '../../model/event/event.dart';
import '../../model/event_detail/event_detail.dart';
import '../../util/const/style/global_logger.dart';

class EventApi {
  static Pagination event = Pagination(isLast: false, totalCnt: 0);

  ///<h2>12-1 API | 이벤트 리스트 조회</h2>
  ///* pagination
  static Future<List<Event>> getEventList({bool getMore = false}) async {
    try {
      if (!getMore) {
        event.currentpage = 0;
      }
      Response response = await DioServices().to().get("/events",
          queryParameters: {
            "page": event.currentpage,
            "size": PAGINATION_SIZE
          });
      event.totalCnt = response.data[RESULT][TOTAL];
      event.isLast = response.data[RESULT][LAST];

      logger.d(
          "Event pagination 정보: totalCnt:${event.totalCnt}, currentPage:${event.currentpage} isLast:${event.isLast}");

      return List.generate(response.data[RESULT][CONTENTS].length,
          (index) => Event.fromJson(response.data[RESULT][CONTENTS][index]));
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }

  ///<h2>11-2API | 이벤트 세부 내용 조회</h2>
  static Future<EventDetail?> getEventDetail({required int eventId}) async {
    try {
      Response response = await DioServices().to().get("/events/${eventId}");

      return EventDetail.fromJson(response.data[RESULT]);
    } catch (e) {
      logger.e(e.toString());
      return null;
    }
  }
}
