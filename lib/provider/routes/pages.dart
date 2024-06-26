import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match/modules/alarm/binding/alarm_binding.dart';
import 'package:match/modules/alarm/view/alarm_view.dart';
import 'package:match/modules/buring_match/binding/burning_match_binding.dart';
import 'package:match/modules/buring_match/view/burning_match_view.dart';
import 'package:match/modules/donate/binding/donate_binding.dart';
import 'package:match/modules/donate/view/donate_view.dart';
import 'package:match/modules/donation_search/binding/donation_search_binding.dart';
import 'package:match/modules/donation_search/view/donation_search_view.dart';
import 'package:match/modules/event_detail/binding/event_detail_binding.dart';
import 'package:match/modules/event_detail/view/event_detail_view.dart';
import 'package:match/modules/like_project/binding/like_project_binding.dart';
import 'package:match/modules/like_project/view/like_project_view.dart';
import 'package:match/modules/mypage/binding/nickname_binding.dart';
import 'package:match/modules/mypage/view/mypage_view.dart';
import 'package:match/modules/mypage/view/nickname_edit_view.dart';
import 'package:match/modules/mypage/view/setting_view.dart';
import 'package:match/modules/onboarding/binding/onboarding_binding.dart';
import 'package:match/modules/onboarding/view/onboarding_view.dart';
import 'package:match/modules/payment/binding/payment_binding.dart';
import 'package:match/modules/payment/binding/payment_detail_binding.dart';
import 'package:match/modules/payment/view/payment_detail_view.dart';
import 'package:match/modules/project/binding/project_binding.dart';
import 'package:match/modules/project/view/project_view.dart';
import 'package:match/modules/signIn/binding/login_binding.dart';
import 'package:match/modules/signIn/view/login_view.dart';
import 'package:match/modules/signUp/binding/signup_binding.dart';
import 'package:match/modules/signUp/view/signup_user_mail_view.dart';
import 'package:match/modules/total_pay/view/total_pay_view.dart';
import 'package:match/modules/tutorial/view/tutorial_view.dart';
import 'package:match/modules/user_paymethod/binding/user_paymethod_binding.dart';
import 'package:match/modules/user_paymethod/view/user_paymethod_view.dart';
import 'package:match/modules/user_phone/binding/user_phone_binding.dart';
import 'package:match/modules/user_phone/view/user_phone_view.dart';

import '../../modules/alarm/binding/alarm_detail_binding.dart';
import '../../modules/alarm/view/alarm_detail_view.dart';
import '../../modules/event/binding/event_binding.dart';
import '../../modules/event/view/event_view.dart';
import '../../modules/home/binding/home_binding.dart';
import '../../modules/home/view/home_view.dart';
import '../../modules/main/binding/main_binding.dart';
import '../../modules/main/view/main_view.dart';
import '../../modules/mypage/binding/setting_binding.dart';
import '../../modules/notice/binding/notice_binding.dart';
import '../../modules/notice/binding/notice_detail_binding.dart';
import '../../modules/notice/view/notice_detail_view.dart';
import '../../modules/notice/view/notice_view.dart';
import '../../modules/review/binding/review_binding.dart';
import '../../modules/review/view/review_view.dart';
import '../../modules/total_pay/binding/total_pay_binding.dart';
import '../../modules/tutorial/binding/tutorial_binding.dart';
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
      title: "로그인 화면",
      name: Routes.login,
      page: () => const LoginScreen(),
      transition: Transition.noTransition,
      binding: LoginBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "회원가입 화면",
      name: Routes.sign_up,
      page: () => SignUpMailScreen(),
      transition: Transition.noTransition,
      binding: SignUpBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "튜토리얼 화면",
      name: Routes.tutorial,
      page: () => const TutorialScreen(),
      transition: Transition.noTransition,
      binding: TutorialBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "유저 메인 화면",
      name: Routes.main,
      page: () => const MainScreen(),
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
    ),
    GetPage(
      title: "설문조사 화면",
      name: Routes.review,
      page: () => const ReviewScreen(),
      transition: Transition.noTransition,
      binding: ReviewBinding(),
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
    GetPage(
      title: "후원 상세내역",
      name: Routes.project,
      page: () => const ProjectScreen(),
      transition: Transition.noTransition,
      //TODO:binding 교체
      binding: ProjectBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
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
      title: "이벤트 상세화면",
      name: Routes.event_detail,
      page: () => const EventDetailScreen(),
      transition: Transition.noTransition,
      binding: EventDetailBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "마이페이지 화면",
      name: Routes.mypage,
      page: () => const MypageScreen(),
      transition: Transition.noTransition,
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "기부 결제 내역",
      name: Routes.total_pay,
      page: () => const TotalPayScreen(),
      transition: Transition.noTransition,
      binding: TotalPayBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "결제 상세내역",
      name: Routes.payment_detail,
      page: () => const PaymentDetailScreen(),
      transition: Transition.noTransition,
      binding: PaymentDetailBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "공지사항 화면",
      name: Routes.notice,
      page: () => const NoticeScreen(),
      transition: Transition.noTransition,
      binding: NoticeBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "닉네임 화면",
      name: Routes.nickname,
      page: () => NicknameEditScreen(),
      transition: Transition.noTransition,
      binding: NicknameBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "핸드폰 번호 변경화면",
      name: Routes.phone,
      page: () => const UserPhoneScreen(),
      transition: Transition.noTransition,
      binding: UserPhoneBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "간편결제 관리 화면",
      name: Routes.pay_method,
      page: () => UserPayMethodScreen(),
      transition: Transition.noTransition,
      binding: UserPayMethodBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "공지사항 상세 화면",
      name: Routes.notice_detail,
      page: () => const NoticeDetailScreen(),
      transition: Transition.noTransition,
      binding: NoticeDetailBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "알람 화면",
      name: Routes.alarm,
      page: () => const AlarmScreen(),
      transition: Transition.noTransition,
      binding: AlarmBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "알람 상세 화면",
      name: Routes.setting,
      page: () => const SettingScreen(),
      transition: Transition.noTransition,
      binding: SettingBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "알람 상세 화면",
      name: Routes.alarm_detail,
      page: () => const AlarmDetailScreen(),
      transition: Transition.noTransition,
      binding: AlarmDetailBinding(),
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
    GetPage(
      title: "찜한 후원처 화면",
      name: Routes.like_project,
      page: () => const LikeProjectScreen(),
      transition: Transition.noTransition,
      binding: LikeProjectBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "검색 화면",
      name: Routes.donation_search,
      page: () => const DonationSearchScreen(),
      transition: Transition.noTransition,
      binding: DonationSearchBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
  ];
}
