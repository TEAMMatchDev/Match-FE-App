import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/tutorial_controller.dart';

class TutorialScreen extends GetView<TutorialController> {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("TutorialScreen"),
          ),
        ],
      ),
    );
  }
}
