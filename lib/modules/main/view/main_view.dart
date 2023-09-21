import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match/util/style/global_text_styles.dart';

import '../controller/main_controller.dart';

class MainScren extends GetView<MainController> {
  const MainScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('main'),
    );
  }
}
