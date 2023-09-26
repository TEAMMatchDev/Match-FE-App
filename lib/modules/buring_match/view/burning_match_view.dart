import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/burning_match_controller.dart';

class BurningMatchScreen extends GetView<BurningMatchController> {
  const BurningMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('BurningMatch'),
    );
  }
}
