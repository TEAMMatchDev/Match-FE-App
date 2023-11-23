import 'package:get/get.dart';
import 'package:match/modules/donate/controller/donate_controller.dart';
import 'package:match/modules/event/controller/event_controller.dart';
import 'package:match/modules/home/controller/home_controller.dart';
import 'package:match/modules/main/controller/main_controller.dart';
import 'package:match/modules/signUp/controller/signup_controller.dart';
import 'package:match/provider/service/auth_service.dart';

import '../controller/login_controller.dart';

///* SPLASH 이후 작동하는 binding
class LoginBinding implements Bindings {
  @override
  void dependencies() {
    //Get.put(LoginController());
    Get.put(LoginController(), permanent: true);
    Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);

    //profile 정보는 로그인 이후에 가져와야기 때문에
    // auth serivce 초기화 코드 주석처리
    Get.put(AuthService());
  }
}
