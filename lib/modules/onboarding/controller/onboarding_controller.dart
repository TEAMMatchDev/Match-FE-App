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
      DioServices().setAccessToken(token);

      /// 자동로그인 테스트 임시 라우팅
      Fluttertoast.showToast(msg: "자동 로그인 되었습니다.");
      Get.offAllNamed(Routes.main);
    }
  }
}
