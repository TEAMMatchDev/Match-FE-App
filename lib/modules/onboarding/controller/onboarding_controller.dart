import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../provider/api/util/dio_services.dart';
import '../../../provider/routes/routes.dart';
import '../../../util/method/get_storage.dart';

class OnboardingController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    var token = await GetStorageUtil.getToken(StorageKey.ACCESS_TOKEN);
    if (token != null) {
      // DioServices().setAccessToken(token);
      DioServices().setAccessToken(
          "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFM1MTIifQ.eyJ1c2VySWQiOjEsImlhdCI6MTY5OTQ1NzM5NSwiZXhwIjoxNjk5NDg4OTMxfQ.MvtjhWbAyiXr0MgvImkbgSHitodnHIsq0ZOE59A0uz2UHZnpO3ZnWyrSt3Fa2L-7-_iBqQDOdn7Zw69m72ZQTQ");

      /// 자동로그인 테스트 임시 라우팅
      Fluttertoast.showToast(msg: "자동 로그인 되었습니다.");
      Get.offAllNamed(Routes.main);
    }
  }
}
