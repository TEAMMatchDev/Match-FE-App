
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurveyController extends GetxController {
  Rx<int> donateRate = 4.obs;
  Rx<int> truthRate = 4.obs;
  Rx<int> informRate = 4.obs;

  Rx<TextEditingController> commentTextController = TextEditingController().obs;

  RxBool isSubmit = false.obs;
}
