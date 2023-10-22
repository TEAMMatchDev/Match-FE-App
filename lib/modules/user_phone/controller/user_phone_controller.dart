import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../provider/service/auth_service.dart';

class UserPhoneController extends GetxController {
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> authCodeController = TextEditingController().obs;
  Rx<bool> phoneChange = false.obs;
  Rx<bool> isPhoneValid = false.obs;

  Rx<bool> validNumChange = false.obs;
  Rx<bool> isSendValidNum = false.obs;

  Rx<bool> canChange = false.obs;
}
