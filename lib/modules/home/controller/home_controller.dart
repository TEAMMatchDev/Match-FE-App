import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_share.dart';
import 'package:match/provider/api/banner_api.dart';
import 'package:match/provider/api/flame_api.dart';
import 'package:match/provider/api/util/global_api_field.dart';
import 'package:match/util/const/global_variable.dart';
import '../../../model/banner/banners.dart';
import '../../../model/enum/banner_type.dart';
import '../../../model/flame/flame.dart';
import '../../../util/const/style/global_logger.dart';
import '../../../util/method/dynamic_link.dart';

///* [HomeScreen]에서 사용하는 controller
class HomeController extends GetxController {
  /// ▼ 변수

  /// banner 현재 화면에 보이는 ui의 index
  RxInt currentIdx = 1.obs;

  /// banner 전체 개수
  RxInt adCount = 2.obs;
  RxList<Banners> bannerList = <Banners>[
    Banners(
        bannerId: -2,
        bannerType: BannerType.CONTENTS.name,
        bannerImg: imgDir + "iv_ad_1.png"),
    Banners(
        bannerId: -1,
        bannerType: BannerType.CONTENTS.name,
        bannerImg: imgDir + "iv_ad_2.png",
        contentsUrl: "https://litt.ly/match.official"),
  ].obs;

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
      flameList.addAll(await FlameApi.getBurningFlameList(getMore: true));
      FlameApi.burningFlame.currentpage = index;
    }
  }

  ///*카카오톡 공유하기 메소드
  Future<void> kakoShare(
      {required String imgUrl, required int projectId}) async {
    var appLink =
        await DynamicLink.getShortLink(screenName: "project", id: projectId);
    logger.e(appLink);
    ShareClient shareClient = ShareClient.instance;
    //카카오톡 설치 여부 판별
    bool isKakaoTalkSharingAvailable =
        await shareClient.isKakaoTalkSharingAvailable();
    //카카오톡 공유하기 위젯
    final FeedTemplate shareFeed = FeedTemplate(
      content: Content(
        title: "MATCH",
        description: "따뜻한 마음을 가지는 순간!\n여러분의 마음속에서 불꽃이가 나타나요.\n같이 불꽃이를 만들어보실래요?",
        imageUrl: Uri.parse(imgUrl),
        link: Link(
          mobileWebUrl: Uri.parse(appLink),
          // iosExecutionParams: ,
        ),
      ),
      buttons: [
        Button(
          title: "매치 보러가기",
          link: Link(
            mobileWebUrl: Uri.parse(appLink),
          ),
        ),
      ],
    );

    if (isKakaoTalkSharingAvailable) {
      try {
        Uri uri = await shareClient.shareDefault(template: shareFeed);
        await shareClient.launchKakaoTalk(uri);
        logger.d('카카오톡 공유 완료');
      } catch (error) {
        logger.d('카카오톡 공유 실패 $error');
      }
    } else {
      try {
        Uri shareUrl =
            await WebSharerClient.instance.makeDefaultUrl(template: shareFeed);
        await launchBrowserTab(shareUrl, popupOpen: true);
      } catch (error) {
        logger.d('카카오톡 공유 실패 $error');
      }
    }
  }

  @override
  void onInit() async {
    super.onInit();

    ///* home의 경우, 자동로그인이 적용되었을때
    /// MainBinding에서 mypage API와 동시 호출되어 refresh api 중복호출 가능성이 있음
    /// 이에 API를 3초 가량 delay후 호출
    Future.delayed(Duration(seconds: 2), () async {
      //기획 변경으로 인한 api 사용 X
      // bannerList.assignAll(await BannerApi.getBannerList());
      // adCount.value = bannerList.length;

      flameList.assignAll(await FlameApi.getBurningFlameList());
      totalCnt = FlameApi.burningFlame.totalCnt.obs;
    });
  }
}
