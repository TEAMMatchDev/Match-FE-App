import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:match/model/comment/comment.dart';
import 'package:match/provider/api/util/global_api_field.dart';
import '../../model/api/pagination.dart';
import '../../util/const/style/global_logger.dart';
import 'util/dio_services.dart';

class CommentApi {
  static const commentPath = "/projects/comment/";

  ///* 3-4 pagination 추가 호출 판별 함수
  static Pagination comments = Pagination(isLast: false, totalCnt: 0);

  ///<h2>3-4 API | 응원 목록 조회하기</h2>
  ///*pagination
  static Future<List<Comment>> getComments(
      {bool getMore = false, required int projectId}) async {
    if (!getMore) {
      comments.currentpage = 0;
    }
    var queryParameters = {
      "page": comments.currentpage,
      "size": PAGINATION_SIZE,
      "filter": "LATEST",
    };
    try {
      Response response = await DioServices()
          .to()
          .get("$commentPath$projectId", queryParameters: queryParameters);
      comments.totalCnt = response.data[RESULT][TOTAL];
      comments.isLast = response.data[RESULT][LAST];
      logger.d(
          "pagination 정보: totalCnt:${comments.totalCnt}, currentPage:${comments.currentpage} isLast:${comments.isLast}");

      return List.generate(response.data[RESULT][CONTENTS].length,
          (index) => Comment.fromJson(response.data[RESULT][CONTENTS][index]));
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return [];
    }
  }

  ///<h2>3-10 API | 응원 등록하기</h2>
  static Future<Comment?> registerComment({
    required String comment,
    required int projectId,
  }) async {
    try {
      Response response =
          await DioServices().to().post("$commentPath$projectId", data: {
        "comment": comment,
      });
      return Comment.fromJson(response.data[RESULT]);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return null;
    }
  }

  ///<h2>3-11 API | 응원 신고하기</h2>
  static Future<bool> reportComment({
    required String comment,
    required int commentId,
    required String reportReason,
  }) async {
    try {
      Response response = await DioServices()
          .to()
          .post("${commentPath}report/${commentId}", queryParameters: {
        "reportReason": reportReason,
      });
      return response.data[SUCCESS];
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return false;
    }
  }

  ///<h2>3-12 API | 응원 삭제하기</h2>
  static Future<bool> deleteComment({
    required int commentId,
  }) async {
    try {
      Response response =
          await DioServices().to().delete("$commentPath$commentId");
      return response.data[SUCCESS];
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return false;
    }
  }
}
