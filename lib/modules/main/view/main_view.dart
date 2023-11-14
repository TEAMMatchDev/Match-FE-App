import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:match/modules/donate/view/donate_view.dart';
import 'package:match/modules/event/view/event_view.dart';
import 'package:match/modules/home/view/home_view.dart';
import 'package:match/modules/mypage/view/mypage_view.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../util/const/style/global_color.dart';
import '../controller/main_controller.dart';

///* <h2>BottomNavigation 설정을 위해 상위 라우팅으로 설정 </h2>
class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: [
          HomeScreen(),
          DonateScreen(),
          EventScreen(),
          MypageScreen(),
        ][controller.selectIdx.value],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          currentIndex: controller.selectIdx.value,
          onTap: ((value) async {
            controller.selectIdx.value = value;
          }),
          selectedItemColor: AppColors.grey9,
          selectedLabelStyle: AppTextStyles.T1Bold12,
          unselectedItemColor: AppColors.grey3,
          unselectedLabelStyle:
              AppTextStyles.T1Bold12.copyWith(color: AppColors.grey3),
          items: [
            bottomNaviItem(iconUrl: 'home', naviText: '홈'),
            bottomNaviItem(iconUrl: 'search', naviText: '검색'),
            bottomNaviItem(iconUrl: 'event', naviText: '이벤트'),
            bottomNaviItem(iconUrl: 'mypage', naviText: 'MY'),
          ],
        ),
      ),
    );
  }
}

BottomNavigationBarItem bottomNaviItem({
  required String iconUrl,
  required String naviText,
}) {
  return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        "asset/image/icon/bottomNavi/ic_${iconUrl}_20.svg",
        height: 20.h,
      ),
      activeIcon: SvgPicture.asset(
        "asset/image/icon/bottomNavi/ic_${iconUrl}_able_20.svg",
        height: 20.h,
      ),
      backgroundColor: AppColors.white,
      label: naviText);
}
