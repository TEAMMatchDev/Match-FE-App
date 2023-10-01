import 'package:get/get.dart';
import 'package:match/model/recent_search/recent_search.dart';

//SearchController class가 있어서 해당 이름으로 수정
class SearchViewController extends GetxController {
  //검색어
  RxString searchText = "".obs;
  //최근 검색어 list
  RxList<RecentSearch> recentSearchList = <RecentSearch>[
    RecentSearch(name: "ㄹㅇㄴㄹㄴ", title: "후원처 이름", projectId: 1),
    RecentSearch(name: "ㄹㅇㄴㄹㄴ", title: "후원처 이름", projectId: 1)
  ].obs;

  //최근 검색어 위젯 활성화 여부
  Rx<bool> isEditStart = false.obs;
}
