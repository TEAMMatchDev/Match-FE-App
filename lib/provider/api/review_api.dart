import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:match/model/popup/popup_info.dart';
import 'package:match/provider/api/util/global_api_field.dart';

import '../../model/review/review.dart';
import 'util/dio_services.dart';

class ReviewApi {
  static const reviewPath = "/reviews";

  ///<h2>13-01 API | Review 작성유무</h2>
  ///[HomeScreen] init에서 호출하여 팝업 노출
  static Future<PopupInfo?> getReviewPopup() async {
    try {
      Response response = await DioServices().to().get(reviewPath);
      return PopupInfo.fromJson(response.data[RESULT]);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return null;
    }
  }

  ///<h2>13-02 API | Review 등록</h2>
  static Future<bool> registerReview({required Review review}) async {
    try {
      Response response =
          await DioServices().to().post(reviewPath, data: review.toJson());
      return response.data[SUCCESS];
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return false;
    }
  }
}
