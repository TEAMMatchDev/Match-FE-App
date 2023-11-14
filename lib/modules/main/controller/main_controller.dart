import 'package:get/get.dart';
import 'package:match/provider/service/auth_service.dart';

class MainController extends GetxController {
  ///* 선택된 탭의 인덱스
  Rx<int> selectIdx = 0.obs;

  @override
  void onInit() async{
    super.onInit();
    await AuthService.to.getUserInfo();
    await AuthService.to.getDonatorInfo();
  }
}
