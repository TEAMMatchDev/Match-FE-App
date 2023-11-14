import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match/util/components/global_app_bar.dart';

import '../controller/survey_controller.dart';

class SurveyScreen extends GetView<SurveyController> {
  const SurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.basic("MATCH 리뷰"),
    );
  }
}
