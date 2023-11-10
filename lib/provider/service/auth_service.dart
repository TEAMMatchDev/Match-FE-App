import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:match/provider/api/order_api.dart';
import 'package:match/util/const/global_mock_data.dart';

import '../../model/profile/profile.dart';
import '../../model/donator/donator.dart';
import '../api/mypage_api.dart';

class AuthService extends GetxService{
  static AuthService get to => Get.find();
  ///튜토리얼 진행시 사용자 이름을 출력하기 위한 변수
  ///회원가입시 저장해줘야함
  RxString name = "".obs;
  RxString nickName = "".obs;

  Rx<Profile> myProfile = tmpProfile.obs;
  Rx<Donator> donatorProfile = tmpDonator.obs;

  void setPhone(String phone) {
    myProfile.value = myProfile.value.copyWith(phone: phone);
  }
  ///<h2>회원 정보 가져오는 함수</h2>
  ///로그인 이후 가져와야하기 때문에 onInit에서 분리
  Future<void> getUserInfo() async{
    var tmpResult = await MypageApi.getProfile();
    if (tmpResult != null) {
      myProfile.value = tmpResult;
    }
  }
  ///<h2>후원자 정보 가져오는 함수</h2>
  ///로그인 이후 가져와야하기 때문에 onInit에서 분리
  Future<void> getDonatorInfo() async{
    var tmpResult = await OrderApi.getProfile();
    if (tmpResult != null) {
      donatorProfile.value = tmpResult;
      print(">>> 기부자 프로필 조회: ${donatorProfile.value}");
    }
  }
  @override
  void onInit() async {
    super.onInit();

  }
}