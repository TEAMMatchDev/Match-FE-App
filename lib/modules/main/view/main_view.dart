import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:match/util/style/global_text_styles.dart';

import '../../../util/style/global_color.dart';
import '../controller/main_controller.dart';

class MainScren extends GetView<MainController> {
  const MainScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('main'),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: controller.selectIdx.value,
        onTap: ((value) async {
          controller.selectIdx.value = value;
        }),
        selectedItemColor: AppColors.grey9,
        selectedLabelStyle: AppTextStyles.body2Bold,
        unselectedItemColor: AppColors.grey3,
        unselectedLabelStyle:
            AppTextStyles.body2Bold.copyWith(color: AppColors.grey3),
        items: [
          bottomNaviItem(iconUrl: 'home', naviText: '홈'),
          bottomNaviItem(iconUrl: 'donate', naviText: '후원'),
          bottomNaviItem(iconUrl: 'event', naviText: '이벤트'),
          bottomNaviItem(iconUrl: 'mypage', naviText: 'MY'),
        ],
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
