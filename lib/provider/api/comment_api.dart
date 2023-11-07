import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:match/model/comment/comment.dart';
import 'package:match/provider/api/util/global_api_field.dart';
import 'util/dio_services.dart';

class CommentApi {
  static const commentPath = "/projects/comment/";

  ///<h2>3-4 API | 응원 신고하기</h2>
  ///pagination 처리 여부 확인 필요
  static Future<List<Comment>> getComments() async {
    try {
      Response response = await DioServices().to().get(commentPath);

      return List.generate(response.data[RESULT].length,
          (index) => Comment.fromJson(response.data[RESULT][index]));
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return [];
    }
  }

  ///<h2>3-10 API | 응원 등록하기</h2>
  static Future<bool> registerComment({
    required String comment,
    required int projectId,
  }) async {
    try {
      Response response =
          await DioServices().to().post("$commentPath$projectId", data: {
        "comment": comment,
      });
      return response.data[SUCCESS];
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return false;
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
