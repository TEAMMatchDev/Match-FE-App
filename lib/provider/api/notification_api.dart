import 'package:dio/dio.dart';
import 'package:match/model/enum/alarm_type.dart';
import 'package:match/model/notification/notification.dart';
import 'package:match/model/notification_permission/notification_permission.dart';
import 'package:match/provider/api/util/dio_services.dart';
import 'package:match/provider/api/util/global_api_field.dart';

import '../../model/api/pagination.dart';
import '../../util/const/global_mock_data.dart';
import '../../util/const/style/global_logger.dart';

class NotificationApi {
  ///<h2>2-7API | 유저 FCM 토큰 생성 후 조회</h2>
  static Future<bool> setAlarmToken({
    required String fcmToken,
    required String deviceId,
  }) async {
    try {
      Response response = await DioServices().to().post("/users/fcm",
          data: {"fcmToken": fcmToken, "deviceId": deviceId});

      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  static Pagination notification = Pagination(isLast: false, totalCnt: 0);

  ///<h2>10-1 API | 알람 리스트 조회</h2>
  ///* pagination
  static Future<List<Notification>> getNotificationList(
      {bool getMore = false}) async {
    try {
      if (!getMore) {
        notification.currentpage = 0;
      } else {
        notification.currentpage += 1;
      }
      Response response = await DioServices().to().get("/notifications",
          queryParameters: {
            "page": notification.currentpage,
            "size": PAGINATION_SIZE
          });
      notification.totalCnt = response.data[RESULT][TOTAL];
      notification.isLast = response.data[RESULT][LAST];

      logger.d(
          "Notification pagination 정보: totalCnt:${notification.totalCnt}, currentPage:${notification.currentpage} isLast:${notification.isLast}");

      return List.generate(
          response.data[RESULT][CONTENTS][NOTIFICATIONS].length,
          (index) => Notification.fromJson(
              response.data[RESULT][CONTENTS][NOTIFICATIONS][index]));
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }

  ///<h2>2-9API | 알람 동의 항목 조회</h2>
  static Future<NotificationPermission> getAlarmPermission() async {
    String serviceAlarm = "serviceAlarm";
    String eventAlarm = "eventAlarm";
    String ACTIVE = "ACTIVE";
    try {
      Response response = await DioServices().to().get("/users/alarm");
      final result = response.data[RESULT];
      return NotificationPermission(
          serviceAlarm: result[serviceAlarm] == ACTIVE ? true : false,
          eventAlarm: result[eventAlarm] == ACTIVE ? true : false);
    } catch (e) {
      logger.e(e.toString());
      return tmpNotificationPermission;
    }
  }

  ///<h2>2-10API | 알람 동의 항목 수정</h2>
  static Future<bool> setAlarmPermission({required AlarmType type}) async {
    try {
      Response response = await DioServices()
          .to()
          .patch("/users/alarm", queryParameters: {"alarmType": type.name});
      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }
}
