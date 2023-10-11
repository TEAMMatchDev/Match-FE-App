import 'package:dio/dio.dart';
import 'package:match/model/enum/project_type.dart';
import 'package:match/provider/api/util/dio_services.dart';
import 'package:match/provider/api/util/global_api_field.dart';

import '../../model/today_project/today_project.dart';
import '../../util/const/style/global_logger.dart';

class ProjectApi {
  ///<h2>3-5 API;프로젝트 리스트</h2>
  //TODO: type nullable
  //TODO: pagination 적용
  static Future<List<TodayProject>> getProjectList({
    required ProjectType type,
    String? content,
  }) async {
    Response response =
        await DioServices().to().get("/projects/list", queryParameters: {
      "page": 0,
      "size": 10,
      "projectKind": type.name,
    });
    // logger.d(response.data);
    return List.generate(
      response.data[RESULT][CONTENTS].length,
      (index) => TodayProject.fromJson(response.data[RESULT][CONTENTS][index]),
    );
  }
}
