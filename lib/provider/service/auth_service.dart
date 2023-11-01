import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:match/provider/api/order_api.dart';
import 'package:match/util/const/global_mock_data.dart';

import '../../model/profile/profile.dart';
import '../../model/donator/donator.dart';
import '../api/mypage_api.dart';

class AuthService extends GetxService{
  static AuthService get to => Get.find();
  Rx<Profile> myProfile = tmpProfile.obs;
  Rx<Donator> donatorProfile = tmpDonator.obs;

  void setPhone(String phone) {
    myProfile.value = myProfile.value.copyWith(phone: phone);
  }
  @override
  void onInit() async {
    super.onInit();
    var tmpResult = await MypageApi.getProfile();
    if (tmpResult != null) {
      myProfile.value = tmpResult;
    }
    var tmpDonatorResult = await OrderApi.getProfile();
    if(tmpDonatorResult != null) {
      donatorProfile.value = tmpDonatorResult;
    }
  }
}