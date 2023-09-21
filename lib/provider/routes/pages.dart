import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/home/binding/home_binding.dart';
import '../../modules/home/view/home_view.dart';
import 'routes.dart';

class Pages {
  static final routes = [
    GetPage(
      title: "홈 화면",
      name: Routes.home,
      page: () => const HomeScreen(),
      transition: Transition.noTransition,
      binding: HomeBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    )
  ];
}
