import 'package:get/get.dart';
import 'package:match/model/project/project.dart';
import 'package:match/model/recent_search/recent_search.dart';
import 'package:match/modules/home/widget/home_widget.dart';

//SearchController class가 있어서 해당 이름으로 수정
class SearchViewController extends GetxController {
  //검색어
  RxString searchText = "".obs;
  //최근 검색어 list
  RxList<RecentSearch> recentSearchList = <RecentSearch>[
    RecentSearch(name: "ㄹㅇㄴㄹㄴ", title: "후원처 이름", projectId: 1),
    RecentSearch(name: "ㄹㅇㄴㄹㄴ", title: "후원처 이름", projectId: 1)
  ].obs;
  RxList<Project> searchResults = <Project>[
    Project(
        projectId: 1,
        imgUrl: tmpBackgroundImg,
        title: "TBT 유기견 보호",
        usages: "THE BETTER Tommorrow",
        kind: "DOG",
        like: false),
    Project(
        projectId: 2,
        imgUrl: tmpBackgroundImg,
        title: "TBT 유기견 보호",
        usages: "THE BETTER Tommorrow",
        kind: "ELDER",
        like: false)
  ].obs;
  //최근 검색어 위젯 활성화 여부
  Rx<SEARCH_STATUS> searchStatus = SEARCH_STATUS.INIT.obs;
}

enum SEARCH_STATUS {
  //진행중
  INIT,
  //시작 전
  EDIT,
  //마감
  SEARCH
}
