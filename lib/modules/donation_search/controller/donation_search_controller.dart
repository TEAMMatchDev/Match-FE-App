import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:match/model/project/project.dart';
import 'package:match/model/recent_search/recent_search.dart';
import 'package:match/modules/home/widget/home_widget.dart';
import 'package:match/util/method/get_storage.dart';

import '../../../model/enum/search_statu.dart';
import '../../../model/search/search.dart';
import '../../../model/today_project/today_project.dart';
import '../../../provider/api/project_api.dart';
import '../../../provider/api/search_api.dart';
import '../../../provider/api/util/global_api_field.dart';
import '../../../util/const/style/global_logger.dart';

class DonationSearchController extends GetxController {
  //검색 필드 controller
  Rx<TextEditingController> searchTextController = TextEditingController().obs;

  //최근 검색어 위젯 활성화 여부
  Rx<SEARCH_STATUS> searchStatus = SEARCH_STATUS.INIT.obs;

  ///* 검색 결과 리스트
  RxList<TodayProject> projectList = <TodayProject>[].obs;
  RxInt totalSearchLength = 0.obs;

  ///* 추천 검색어 리스트
  RxList<String> recommendSearchList = List.generate(10, (index) => "").obs;

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

  Future<void> getSearchList({required String content}) async {
    projectList.assignAll(await ProjectApi.getProjectList(content: content));
    totalSearchLength.value = ProjectApi.project.totalCnt;

    searchStatus.value = SEARCH_STATUS.SEARCH;
  }

  Future<void> getMoreSearchList(
      {required String content, required int index}) async {
    logger.d(
        "2:  총 페이지수 : ${ProjectApi.project.totalCnt ~/ PAGINATION_SIZE}, 불러오고자 하는 페이지: ${index}");
    if (!(ProjectApi.project.totalCnt ~/ PAGINATION_SIZE >= index) &&
        !ProjectApi.project.isLast) {
      ProjectApi.project.currentpage = index;
      searchStatus.value = SEARCH_STATUS.SEARCH;
      projectList.addAll(await ProjectApi.getProjectList(
        getMore: true,
        content: content,
      ));
    }
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
    await addTimerListenr();
    recommendSearchList.assignAll(await SearchApi.getRecommendSearchList());
  }
}
