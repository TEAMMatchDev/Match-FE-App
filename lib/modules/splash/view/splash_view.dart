import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match/util/style/global_text_styles.dart';

import '../controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('splash'),
    );
  }
}
