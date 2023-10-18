import 'package:dio/dio.dart';
import 'package:match/model/project/project.dart';
import 'package:match/provider/api/util/dio_services.dart';
import 'package:match/provider/api/util/global_api_field.dart';
import '../../util/const/style/global_logger.dart';

class SearchApi {
  ///<h2>3-5 API;프로젝트 리스트</h2>
  //TODO: pagination 적용
  static Future<List<Project>> getSearchResult({
    int page = 0,
    int size = 10,
    String? content,
  }) async {
    try {
      Response response = await DioServices().to().get("/projects/search",
          queryParameters: {"page": 0, "size": 10, "content": content});
      // logger.d(response.data);
      return List.generate(
        response.data[RESULT][CONTENTS].length,
        (index) => Project.fromJson(response.data[RESULT][CONTENTS][index]),
      );
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }
}
