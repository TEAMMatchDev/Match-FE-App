import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/alarm_controller.dart';

class AlarmScreen extends GetView<AlarmController> {
  const AlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          body: Column(
        children: [],
      )),
    );
  }
}
