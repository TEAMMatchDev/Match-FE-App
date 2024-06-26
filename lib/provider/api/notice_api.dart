import 'package:dio/dio.dart';
import 'package:match/model/notice/notice.dart';

import '../../model/api/pagination.dart';
import '../../model/notice_detail/notice_detail.dart';
import '../../util/const/style/global_logger.dart';
import 'util/dio_services.dart';
import 'util/global_api_field.dart';

class NoticeApi {
  static Pagination notice = Pagination(isLast: false, totalCnt: 0);

  ///<h2>11-1 API | 공지사항 리스트 조회</h2>
  ///* pagination
  static Future<List<Notice>> getNoticeList({bool getMore = false}) async {
    try {
      if (!getMore) {
        notice.currentpage = 0;
      } else {
        notice.currentpage += 1;
      }
      Response response = await DioServices().to().get("/notices",
          queryParameters: {
            "page": notice.currentpage,
            "size": PAGINATION_SIZE
          });
      notice.totalCnt = response.data[RESULT][TOTAL];
      notice.isLast = response.data[RESULT][LAST];

      logger.d(
          "Notice pagination 정보: totalCnt:${notice.totalCnt}, currentPage:${notice.currentpage} isLast:${notice.isLast}");

      return List.generate(response.data[RESULT][CONTENTS].length,
          (index) => Notice.fromJson(response.data[RESULT][CONTENTS][index]));
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }

  ///<h2>11-2API | 공지사항 세부 내용 조회</h2>
  static Future<NoticeDetail?> getNoticeDetail({required int noticeId}) async {
    try {
      Response response = await DioServices().to().get("/notices/${noticeId}");

      return NoticeDetail.fromJson(response.data[RESULT]);
    } catch (e) {
      logger.e(e.toString());
      return null;
    }
  }
}
