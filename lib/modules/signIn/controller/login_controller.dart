import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../model/enum/search_status.dart';

class LoginController extends GetxController {
  //TODO) signIn controller
  Rx<TextEditingController> idTextController = TextEditingController().obs;
  Rx<TextEditingController> pwTextController = TextEditingController().obs;
  Rx<TextEditingController> pwConfirmTextController = TextEditingController().obs;

  Rx<SEARCH_STATUS> searchStatus = SEARCH_STATUS.INIT.obs;

  @override
  void onInit() {
    super.onInit();
  }
}
