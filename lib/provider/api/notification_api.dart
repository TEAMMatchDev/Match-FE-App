import 'package:dio/dio.dart';
import 'package:match/model/notification/notification.dart';
import 'package:match/provider/api/util/dio_services.dart';
import 'package:match/provider/api/util/global_api_field.dart';

import '../../model/api/pagination.dart';
import '../../util/const/style/global_logger.dart';

class NotificationApi {
  static Pagination notification = Pagination(isLast: false, totalCnt: 0);

  ///<h2>10-1 API | 알람 리스트 조회</h2>
  ///* pagination
  static Future<List<Notification>> getNotificationList({bool getMore = false}) async {
    try {
      if (!getMore) {
        notification.currentpage = 0;
      }
      Response response = await DioServices().to().get("/events",
          queryParameters: {
            "page": notification.currentpage,
            "size": PAGINATION_SIZE
          });
      notification.totalCnt = response.data[RESULT][TOTAL];
      notification.isLast = response.data[RESULT][LAST];

      logger.d(
          "Notification pagination 정보: totalCnt:${notification.totalCnt}, currentPage:${event.currentpage} isLast:${event.isLast}");

      return List.generate(
          response.data[RESULT][CONTENTS].length,
          (index) =>
              Notification.fromJson(response.data[RESULT][CONTENTS][NOTIFICATIONS][index]));
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }
}
