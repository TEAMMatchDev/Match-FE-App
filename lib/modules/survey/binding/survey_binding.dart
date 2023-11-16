import 'package:get/get.dart';

import '../controller/survey_controller.dart';

class SurveyBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SurveyController());
  }
}