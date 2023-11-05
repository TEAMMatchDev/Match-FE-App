import 'package:get/get.dart';
import 'package:match/provider/api/banner_api.dart';
import 'package:match/provider/api/flame_api.dart';
import 'package:match/provider/api/util/global_api_field.dart';
import '../../../model/banner/banners.dart';
import '../../../model/flame/flame.dart';

///* [HomeScreen]에서 사용하는 controller
class HomeController extends GetxController {
  /// ▼ 변수

  /// banner 현재 화면에 보이는 ui의 index
  RxInt currentIdx = 1.obs;

  /// banner 전체 개수
  RxInt adCount = 0.obs;
  RxList<Banners> bannerList = <Banners>[].obs;

  /// flame 전체 개수
  /// * flame 전체 개수를 화면에 text형태로 표시하기 위해
  /// pagination 처리이전에 전체 개수를 ui 상에 표시
  RxInt totalCnt = 0.obs;
  RxList<Flame> flameList = <Flame>[].obs;

  /// ▼ 함수

  ///<h2> Carousel builder에서 호출하는 pagination 추가 호출 함수 </h2>
  ///* 총 데이터 수와 비교하여, 페이지를 더 늘릴수있다면 api 호출, 그렇지 않다면 호출 X
  Future<void> getMoreFlame(int index) async {
    if (!(FlameApi.burningFlame.totalCnt ~/ PAGINATION_SIZE <
            FlameApi.burningFlame.currentpage + 1) &&
        !FlameApi.burningFlame.isLast) {
      FlameApi.burningFlame.currentpage = index;

      flameList.addAll(await FlameApi.getBurningFlameList(getMore: true));
    }
  }

  @override
  void onInit() async {
    super.onInit();
    bannerList.assignAll(await BannerApi.getBannerList());
    adCount.value = bannerList.length;

    flameList.assignAll(await FlameApi.getBurningFlameList());
    totalCnt = FlameApi.burningFlame.totalCnt.obs;
  }
}
