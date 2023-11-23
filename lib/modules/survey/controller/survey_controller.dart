import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/const/style/global_logger.dart';

class SurveyController extends GetxController {
  Rx<int> donateRate = 4.obs;
  Rx<int> truthRate = 4.obs;
  Rx<int> informRate = 4.obs;

  Rx<TextEditingController> commentTextController = TextEditingController().obs;
  Rx<ScrollController> scrollController = ScrollController().obs;

  // 키보드 상태에 따라 스크롤 조절
  void _scrollListener() async{
    var status =  _isKeyboardVisible();
    logger.e(status);
    if (status) {
      // 키보드가 올라온 경우
      double offset = scrollController.value.position.maxScrollExtent;
      logger.e(offset);
      await scrollController.value.animateTo(offset+100, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
      logger.e(scrollController.value.position.pixels);

    } else {
      // 키보드가 내려간 경우
      await scrollController.value.animateTo(0, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
    }
  }

  // 키보드가 화면에 보이는지 확인
  bool _isKeyboardVisible() {
    final focusNode = FocusScope.of(Get.context!);
    return !focusNode.hasPrimaryFocus && focusNode.hasFocus;
  }
  @override
  void onInit() {
    super.onInit();
    scrollController.value.addListener(_scrollListener);
  }
  @override
  void dispose() {
    super.dispose();
    scrollController.value.dispose();
  }
}
