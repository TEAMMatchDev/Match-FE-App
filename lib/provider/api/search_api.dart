import 'package:dio/dio.dart';
import 'package:match/model/project/project.dart';
import 'package:match/model/recommend_search.dart/recommend_search.dart';
import 'package:match/provider/api/util/dio_services.dart';
import 'package:match/provider/api/util/global_api_field.dart';
import '../../model/api/pagination.dart';
import '../../util/const/style/global_logger.dart';

class SearchApi {
  ///<h2>9-1 API | 검색탭 - 프로젝트 검색전 추천 검색어</h2>
  ///* pagination X, size가 10인 List<String> 반환
  static Future<List<String>> getRecommendSearchList() async {
    try {
      logger.d("api호출 성공");

      Response response = await DioServices().to().get("/keywords");

      var tmpList = List.generate(10, (index) => "");

      response.data[RESULT].forEach((result) {
        final keyword = RecommendSearch.fromJson(result);
        if (1 <= keyword.priority && keyword.priority <= 10) {
          tmpList[keyword.priority-1] = keyword.keyword;
        }
      });
      return tmpList;
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }
}
