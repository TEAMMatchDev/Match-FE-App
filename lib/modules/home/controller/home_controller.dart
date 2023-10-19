import 'package:get/get.dart';
import 'package:match/model/enum/project_type.dart';
import 'package:match/provider/api/banner_api.dart';
import 'package:match/provider/api/flame_api.dart';
import 'package:match/provider/api/util/global_api_field.dart';
import '../../../model/banner/banners.dart';
import '../../../model/flame/flame.dart';
import '../../../util/const/style/global_logger.dart';

class HomeController extends GetxController {
  //임시 변순
  Rx<bool> isLike = false.obs;
  RxInt currentIdx = 1.obs;
  Rx<int> totalCnt = 0.obs;
  Rx<int> adCount = 2.obs;
  Rx<String> tmpText = ProjectType.ANIMAL.stateName.obs;
  RxList<Flame> flameList = <Flame>[].obs;
  RxList<Banners> bannerList = <Banners>[].obs;

  ///<h2> Carousel builder에서 호출하는 pagination 추가 호출 함수 </h2>
  ///* 총 데이터 수와 비교하여, 페이지를 더 늘릴수있다면 api 호출, 그렇지 않다면 호출 X
  Future<void> getMoreFlame(int index) async {
    logger.d(
        "2:  총 페이지수 : ${FlameApi.burningFlame.totalCnt ~/ PAGINATION_SIZE}, 불러오고자 하는 페이지: ${index}");
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
    flameList.assignAll(await FlameApi.getBurningFlameList());
    totalCnt = FlameApi.burningFlame.totalCnt.obs;
  }
}
