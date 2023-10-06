import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match/model/project/project.dart';
import 'package:match/model/recent_search/recent_search.dart';
import 'package:match/modules/home/widget/home_widget.dart';

import '../../../model/search/search.dart';

//SearchController class가 있어서 해당 이름으로 수정
class SearchViewController extends GetxController {
  //검색 필드 controller
  Rx<TextEditingController> searchTextController = TextEditingController().obs;
  //최근 검색어 list
  RxList<RecentSearch> recentSearchList = <RecentSearch>[
    RecentSearch(name: "ㄹㅇㄴㄹㄴ", title: "후원처 이름", donationId: 1),
    RecentSearch(name: "ㄹㅇㄴㄹㄴ", title: "후원처 이름", donationId: 1)
  ].obs;
  RxList<Search> searchResults = <Search>[
    Search(
        donationId: 157,
        projectId: 2,
        flameName: "임현우님의 반짝이는 불꽃을 입은 친절한 불꽃이",
        projectName: "TBT 유기견 보호",
        imgUrl:
            "https://match-image.s3.ap-northeast-2.amazonaws.com/project/2/61519f9b-4741-4fdc-82ad-fccf3217d6c1.png"),
    Search(
        donationId: 161,
        projectId: 2,
        flameName: "임현우님의 희미하게 빛나는 불꽃을 입은 대담한 불꽃이",
        projectName: "TBT 유기견 보호",
        imgUrl:
            "https://match-image.s3.ap-northeast-2.amazonaws.com/project/2/61519f9b-4741-4fdc-82ad-fccf3217d6c1.png"),
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
