import 'package:match/model/enum/project_type.dart';
import 'package:match/provider/api/util/dio_extension.dart';
import 'package:match/provider/api/util/dio_services.dart';

import '../../model/today_project/today_project.dart';
import '../../model/util/common/common.dart';
import '../../util/const/style/global_logger.dart';

class ProjectApi {
  static Future<void> getProjectList({
    required ProjectType type,
    String? content,
  }) async {
    ApiResult<dynamic> result =
        await DioServices().to().safeGet("/projects/list", queryParameters: {
      "page": 0,
      "size": 10,
      "projectKind": type.name,
    });
    logger.d(result);

    // return TodayProject.fromJson(result.data);
  }
}
