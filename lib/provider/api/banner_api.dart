import 'package:dio/dio.dart';
import 'package:match/provider/api/util/global_api_field.dart';

import '../../model/banner/banners.dart';
import '../../util/const/style/global_logger.dart';
import 'util/dio_services.dart';

class BannerApi {
  ///<h2>6-1 API | 배너 조회</h2>
  static Future<List<Banners>> getBannerList() async {
    try {
      Response response = await DioServices().to().get("/banners");

      return List.generate(response.data[RESULT].length,
          (index) => Banners.fromJson(response.data[RESULT][index]));
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }
}
