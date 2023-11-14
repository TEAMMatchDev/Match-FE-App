import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/enum/search_status.dart';
import '../../../model/today_project/today_project.dart';
import '../../../provider/api/project_api.dart';
import '../../../provider/api/search_api.dart';
import '../../../provider/api/util/global_api_field.dart';
import '../../../util/const/style/global_logger.dart';

class DonationSearchController extends GetxController {
  ///검색 필드 controller
  Rx<TextEditingController> searchTextController = TextEditingController().obs;

  ///최근 검색어 위젯 활성화 여부
  Rx<SEARCH_STATUS> searchStatus = SEARCH_STATUS.INIT.obs;

  ///* 검색 결과 리스트
  RxList<TodayProject> projectList = <TodayProject>[].obs;

  ///* pagination 처리 전 전체 검색결과 개수
  RxInt totalSearchLength = 0.obs;

  ///* 추천 검색어 리스트
  RxList<String> recommendSearchList = List.generate(10, (index) => "").obs;

  ///▼ 입력을 시작하고, 아무 action이 없을시
  ///자동으로 검색되는 기능을 위한 변수

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
        _timer ??= Timer(const Duration(seconds: 1), () {
          logger.d('1초가 경과했습니다.');
          getSearchList(content: searchTextController.value.text);
          searchStatus.value = SEARCH_STATUS.SEARCH;
        });
      } else {
        // 입력이 있으면 타이머 초기화
        await resetTimer();
      }
    });
  }

  ///* 검색 결과 api를 호출하는 함수
  Future<void> getSearchList({required String content}) async {
    projectList.assignAll(await ProjectApi.getProjectList(content: content));
    totalSearchLength.value = ProjectApi.project.totalCnt;

    searchStatus.value = SEARCH_STATUS.SEARCH;
  }

  ///* 검색 결과 api에대한 pagination을 처리하는 함수
  Future<void> getMoreSearchList(
      {required String content, required int index}) async {
    if (!(ProjectApi.project.totalCnt ~/ PAGINATION_SIZE < index) &&
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
    super.dispose();
    searchTextController.value.dispose();
    await resetTimer();
  }

  @override
  void onInit() async {
    super.onInit();
    await addTimerListenr();
    recommendSearchList.assignAll(await SearchApi.getRecommendSearchList());
  }
}
