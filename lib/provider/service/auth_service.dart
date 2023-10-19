import 'package:get/get.dart';
import 'package:match/util/const/global_mock_data.dart';

import '../../model/profile/profile.dart';
import '../api/mypage_api.dart';

class AuthService extends GetxService{
  static AuthService get to => Get.find();
  Rx<Profile> myProfile = tmpProfile.obs;


  @override
  void onInit() async {
    super.onInit();
    var tmpResult = await MypageApi.getProfile();
    if (tmpResult != null) {
      myProfile.value = tmpResult;
    }
  }
}