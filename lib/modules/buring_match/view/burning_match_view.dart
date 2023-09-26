import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match/modules/buring_match/controller/burning_match_controller.dart';

import '../../../util/components/global_app_bar.dart';

class BurningMatchScreen extends GetView<BurningMatchController> {
  const BurningMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar.basic("후원타이틀"),
        body: ListView(
          children: [
            //TODO: 5-7-1, 5-7-2 위젯 생성
          ],
        ));
  }
}
