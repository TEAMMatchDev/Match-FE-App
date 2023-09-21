import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/donate_controller.dart';

class DonateScreen extends GetView<DonateController> {
  const DonateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('doante'),
    );
  }
}
