import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../controller/mypage_controller.dart';

class MypageScreen extends GetView<MypageController> {
  const MypageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('mypage'),
    );
  }
}
