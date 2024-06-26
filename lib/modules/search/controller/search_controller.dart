import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:match/model/project/project.dart';
import 'package:match/model/recent_search/recent_search.dart';
import 'package:match/modules/home/widget/home_widget.dart';
import 'package:match/util/method/get_storage.dart';

import '../../../model/enum/search_status.dart';
import '../../../model/search/search.dart';
import '../../../util/const/style/global_logger.dart';

//SearchController class가 있어서 해당 이름으로 수정
class SearchViewController extends GetxController {
  //검색 필드 controller
  Rx<TextEditingController> searchTextController = TextEditingController().obs;
  //최근 검색어 list
  RxList<RecentSearch> recentSearchList = <RecentSearch>[].obs;
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

  ///* 아래 함수에서 사용하는 1초를 측정하는 Timer
  Timer? _timer;

  ///* 1초를 초기화하는 로직
  Future<void> resetTimer() async {
    _timer?.cancel();
    _timer = null;
  }

  ///* 검색 필드에 입력이 없을 때 1초 후에 api 호출하는 로직을 위해
  ///textFieldController에 listener를 등록하는 함수
  Future<void> addTimerListenr() async {
    searchTextController.value.addListener(() async {
      if (searchTextController.value.text.isNotEmpty &&
          searchStatus.value == SEARCH_STATUS.EDIT) {
        // 입력이 없을 때 타이머 시작
        if (_timer == null) {
          _timer = Timer(Duration(seconds: 1), () {
            logger.d('1초가 경과했습니다.');
            //TODO: api 호출
            searchStatus.value = SEARCH_STATUS.SEARCH;
          });
        }
      } else {
        // 입력이 있으면 타이머 초기화
        await resetTimer();
      }
    });
  }

  @override
  Future<void> dispose() async {
    searchTextController.value.dispose();
    await resetTimer();
    super.dispose();
  }

  @override
  void onInit() async {
    super.onInit();
    recentSearchList.value =
        await GetStorageUtil.getRecentSearches(StorageKey.NAME_SEARCH);
    await addTimerListenr();
  }
}
