import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match/modules/buring_match/binding/burning_match_binding.dart';
import 'package:match/modules/buring_match/view/burning_match_pay_view.dart';
import 'package:match/modules/buring_match/view/burning_match_view.dart';
import 'package:match/modules/donate/binding/donate_binding.dart';
import 'package:match/modules/donate/view/donate_view.dart';
import 'package:match/modules/mypage/binding/mypage_binding.dart';
import 'package:match/modules/mypage/view/mypage_view.dart';
import 'package:match/modules/onboarding/binding/onboarding_binding.dart';
import 'package:match/modules/onboarding/view/onboarding_view.dart';
import 'package:match/modules/splash/binding/splash_binding.dart';
import 'package:match/modules/splash/view/splash_view.dart';
import 'package:match/modules/login/binding/login_binding.dart';
import 'package:match/modules/login/view/login_view.dart';

import '../../modules/event/binding/event_binding.dart';
import '../../modules/event/view/event_view.dart';
import '../../modules/home/binding/home_binding.dart';
import '../../modules/home/view/home_view.dart';
import '../../modules/main/binding/main_binding.dart';
import '../../modules/main/view/main_view.dart';
import 'routes.dart';

class Pages {
  static final routes = [
    GetPage(
      title: "온보딩 화면",
      name: Routes.onboarding,
      page: () => const OnboardingScreen(),
      transition: Transition.noTransition,
      binding: OnboardingBiding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "스플래시 화면",
      name: Routes.splash,
      page: () => const SplashScreen(),
      transition: Transition.noTransition,
      binding: SplashBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "로그인 화면",
      name: Routes.login,
      page: () => const LoginScreen(),
      transition: Transition.noTransition,
      binding: LoginBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "유저 메인 화면",
      name: Routes.main,
      page: () => const MainScren(),
      transition: Transition.noTransition,
      binding: MainBiding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
        title: "홈 화면",
        name: Routes.home,
        page: () => const HomeScreen(),
        transition: Transition.noTransition,
        binding: HomeBinding(),
        curve: Curves.easeIn,
        popGesture: false,
        children: [
          GetPage(
            title: "불타는 매치 결제내역 화면",
            name: Routes.burning_match_pay,
            page: () => const BurningMatchPayScreen(),
            transition: Transition.noTransition,
            //TODO:binding 교체
            binding: BurningMatchBinding(),
            curve: Curves.easeIn,
            popGesture: false,
          ),
          GetPage(
            title: "불타는 매치 화면",
            name: Routes.burning_match,
            page: () => const BurningMatchScreen(),
            transition: Transition.noTransition,
            binding: BurningMatchBinding(),
            curve: Curves.easeIn,
            popGesture: false,
          ),
        ]),
    GetPage(
      title: "이벤트 화면",
      name: Routes.event,
      page: () => const EventScreen(),
      transition: Transition.noTransition,
      binding: EventBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "마이페이지 화면",
      name: Routes.mypage,
      page: () => const MypageScreen(),
      transition: Transition.noTransition,
      binding: MypageBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "후원 화면",
      name: Routes.donate,
      page: () => const DonateScreen(),
      transition: Transition.noTransition,
      binding: DonateBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
  ];
}
