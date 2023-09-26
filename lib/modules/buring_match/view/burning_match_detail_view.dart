import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match/util/components/global_app_bar.dart';

import '../controller/burning_match_controller.dart';

class BurningMatchTotalScreen extends GetView<BurningMatchController> {
  const BurningMatchTotalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.basic("진행중인 매치"),
      body: ListView(
        children: [],
      ),
    );
  }
}
