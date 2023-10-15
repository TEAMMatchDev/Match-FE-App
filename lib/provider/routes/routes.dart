abstract class _Paths {
  _Paths._();

  /// 스플래시 화면
  static const splash = "/splash";

  /// 온보딩 화면
  static const onboarding = "/onboarding";

  /// 로그인 화면
  static const login = "/login";

  /// 메인 화면
  static const main = "/main";

  /// 홈 화면
  static const home = "/home";

  // /// 검색 화면
  // static const search = "/search";

  ///불타는 매치 화면
  static const burning_match = "/burning_match";

  ///불타는 매치 결제내역 화면
  static const total_pay = "/total_pay";

  ///결제내역
  static const pay = "/pay";

  ///후원 상세내역
  static const project = "/project";

  /// 후원 화면
  static const donate = "/donate";

  /// 후원 검색 화면
  static const donation_search = "/donate_search";

  /// 이벤트 화면
  static const event = "/event";

  /// 마이페이지 화면
  static const mypage = "/mypage";

  ///알람 화면
  static const alarm = "/alarm";

  ///알람 화면
  static const alarm_detail = "/alarm_detail";

  ///알람 화면
  static const notice = "/notice";

  ///알람 화면
  static const notice_detail = "/notice_detail";
}

abstract class Routes {
  Routes._();

  /// 스플래시 화면
  static const splash = _Paths.splash;

  /// 온보딩 화면
  static const onboarding = _Paths.onboarding;

  /// 로그인 화면
  static const login = _Paths.login;

  /// 메인 화면
  static const main = _Paths.main;

  /// 홈 화면
  static const home = _Paths.home;

  // /// 검색 화면
  // static const search = _Paths.search;

  /// 불타는 매치 화면
  static const burning_match = _Paths.burning_match;

  /// 불타는 매치 전체 결제내역 화면
  static const total_pay = _Paths.total_pay;

  /// 불타는 매치 결제 상세 화면
  static const pay = _Paths.pay;

  ///후원 상세내역
  static const project = _Paths.project;

  /// 후원 화면
  static const donate = _Paths.donate;

  /// 후원 검색 화면
  static const donation_search = _Paths.donation_search;

  /// 이벤트 화면
  static const event = _Paths.event;

  /// 마이페이지 화면
  static const mypage = _Paths.mypage;

  /// 공지사항 화면
  static const notice = _Paths.notice;

  /// 공지사항 상세화면
  static const notice_detail = _Paths.notice_detail;

  /// 알람 화면
  static const alarm = _Paths.alarm;

  /// 알람 상세화면
  static const alarm_detail = _Paths.alarm_detail;
}
