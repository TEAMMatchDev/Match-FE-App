import 'package:dio/dio.dart';
import 'package:match/model/enum/project_type.dart';
import 'package:match/model/project_detail/project_detail.dart';
import 'package:match/model/project_history.dart/project_history.dart';
import 'package:match/provider/api/util/dio_services.dart';
import 'package:match/provider/api/util/global_api_field.dart';

import '../../model/today_project/today_project.dart';
import '../../util/const/style/global_logger.dart';

class ProjectApi {
  ///<h2>3-5 API | 프로젝트 리스트</h2>
  //TODO: pagination 적용
  static Future<List<TodayProject>> getProjectList({
    required ProjectType type,
    String? content,
  }) async {
    try {
      Response response = await DioServices().to().get("/projects/list",
          queryParameters: {
            "page": 0,
            "size": 10,
            "projectKind": type.name,
            "filter": "LATEST"
          });
      // logger.d(response.data);
      return List.generate(
        response.data[RESULT][CONTENTS].length,
        (index) =>
            TodayProject.fromJson(response.data[RESULT][CONTENTS][index]),
      );
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }

  ///<h2>3-8 API | 프로젝트 상세조회</h2>
  static Future<ProjectDetail?> getProjectDetail({
    required int projectId,
  }) async {
    try {
      Response response =
          await DioServices().to().get("/projects/detail/${projectId}");
      // logger.d(response.data);
      return ProjectDetail.fromJson(response.data[RESULT]);
    } catch (e) {
      logger.e(e.toString());
      return null;
    }
  }

  ///<h2>3-9 API | 프로젝트 매치 기록 조회</h2>
  //TODO: type nullable
  //TODO: pagination 적용
  static Future<List<ProjectHistory>> getProjectHistory({
    required int projectId,
  }) async {
    try {
      Response response = await DioServices().to().get(
          "/projects/match/${projectId}",
          queryParameters: {"page": 0, "size": 10});
      // logger.d(response.data);
      return List.generate(
          response.data[RESULT][CONTENTS].length,
          (index) =>
              ProjectHistory.fromJson(response.data[RESULT][CONTENTS][index]));
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }
}
