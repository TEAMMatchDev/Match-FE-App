import 'package:get/get.dart';
import 'package:match/modules/donate/controller/donate_controller.dart';
import 'package:match/modules/event/controller/event_controller.dart';
import 'package:match/modules/home/controller/home_controller.dart';
import 'package:match/modules/main/controller/main_controller.dart';
import 'package:match/modules/mypage/controller/mypage_controller.dart';
import 'package:match/modules/signIn/controller/login_controller.dart';
import 'package:match/modules/signUp/controller/signup_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
    Get.put(LoginController());

    Get.lazyPut(()=>MainController());

  }
}
