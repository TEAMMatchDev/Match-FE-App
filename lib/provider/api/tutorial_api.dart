import 'package:dio/dio.dart';
import 'package:match/provider/api/util/dio_services.dart';
import 'package:match/provider/api/util/global_api_field.dart';

import '../../model/recommend_project/recommend_project.dart';
import '../../util/const/style/global_logger.dart';
const String tutorialPath = "/donations/tutorial";

class MypageApi {
  ///<h2>5-13 API | 튜토리얼 - 추천 기부 분야 조회 </h2>
  static Future<List<RecommendProject>> getRecommendProjects() async {
    try {
      Response response = await DioServices().to().get(tutorialPath);

      return List.generate(response.data[RESULT].length,
          (index) => RecommendProject.fromJson(response.data[RESULT][index]));
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }
  ///<h2>5-13 API | 튜토리얼 - 추천 기부 분야 조회 </h2>
  static Future<bool> setDonationTutorial() async {
    try {
      Response response = await DioServices().to().post(tutorialPath);

      return response.data[SUCCESS];
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }
}
