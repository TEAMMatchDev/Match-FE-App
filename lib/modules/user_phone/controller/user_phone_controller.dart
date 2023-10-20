import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../provider/service/auth_service.dart';

class UserPhoneController extends GetxController {
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> authCodeController = TextEditingController().obs;
  Rx<bool> isPhoneValid = false.obs;
}
