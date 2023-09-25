import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match/util/style/global_text_styles.dart';

import '../controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('login'),
    );
  }

}
