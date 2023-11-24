import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/provider/routes/routes.dart';

import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import '../../../util/const/style/global_color.dart';

void main() => runApp(OnboardingWidget());

class OnboardingWidget extends StatefulWidget {
  @override
  _CarouselExampleState createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<OnboardingWidget> {

  final List<String> images = [
    '$imgDir'+'onboarding/iv_onboarding_new1.png',
    '$imgDir'+'onboarding/iv_onboarding_new2.png',
    '$imgDir'+'onboarding/iv_onboarding_new1.png',
  ];
  final List<String> titles = ['Title 1', 'Title 2', 'Title 3'];
  final List<String> descriptions = [
    '안녕! 나는 네가 남을 위하는\n따뜻한 마음이 들 때 피어나는 불꽃이야.',
    '나는 도움을 기다리는 이들이\n\필요한 물품으로 변할 수 있어!',
    '이제 앞으로 내가 무엇으로 변했는지\n너에게 직접 알려줄게. 앞으로 자주 보자!',
  ];

  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30.h),
          SizedBox(height: 10.h),
          skipWidget(), //상단 건너뛰기 버튼
          SizedBox(height: 50.h),
          sliderWidget(images, _currentSlide), //온보딩 이미지
          SizedBox(height: 70.h),
          indicatorWidget(images.length, _currentSlide), //인디케이터
        ],
      ),
    );
  }

  @override
  Widget skipWidget() {
    return Container(
      alignment: Alignment.centerRight, // 오른쪽 정렬을 위한 설정
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 11.h), // 가로 여백 설정
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.login);
        },
        child: Text(
          '건너뛰기',
          style: AppTextStyles.T1Bold13.copyWith(color: AppColors.grey6, decoration: TextDecoration.underline),
          textAlign: TextAlign.center, // 중앙 정렬 설정
        ),
      ),
    );
  }


  @override
  Widget sliderWidget(List<String> images, int currentSlide) {
    return Expanded(
      flex: 3,
      child: CarouselSlider(
        items: images.asMap().entries.map((entry) {
          final int index = entry.key;
          final String image = entry.value;
          final String description = descriptions[index];

          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (index == 2)
                  Stack(
                    children: [
                      Container(
                        child: Image.asset(
                          iconDir + "login/iv_login_msg_background.png",
                          width: 275.w,
                          height: 60.h,
                        ),
                      ),
                      Positioned(
                        bottom: 20.h,
                        left: 65.w,
                        child: Text(
                          '나 방금 행복동에 연탄이 필요한\n할머니를 위한 연탄으로 변했어! ',
                          style: AppTextStyles.T1Bold12.copyWith(color: AppColors.grey7),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                if (index != 2)
                  ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                      image,
                      width: index == 1 ? 167.w : 100.w,
                      height: index == 1 ? 170.h : 100.h,
                    ),
                  ),
                if (index == 2)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      image,
                      width: 100.w,
                      height: 100.h,
                    ),
                  ),
                SizedBox(height: 35.h),
                Container(
                  width: 300.w,
                  height: 70.h,
                  child: Text(
                    description,
                    style: AppTextStyles.T1Bold16,
                    textAlign: TextAlign.center,
                  ),
                ),

              ],
            ),
          );
        }).toList(),
        options: CarouselOptions(
          enableInfiniteScroll: false,
          aspectRatio: 10 / 9.5,  //슬라이드의 종횡비 4:3
          autoPlay: true,
          viewportFraction: 320 / 320, //화면에 보이는 슬라이드 크기
          onPageChanged: (index, reason) {
            setState(() {
              _currentSlide = index;
            });
          },
        ),
      ),
    );
  }


  @override
  Widget indicatorWidget(int itemCount, int currentSlide) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(itemCount, (index) {
              return Container(
                width: 6.w,
                height: 6.h,
                margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 6.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentSlide == index ? AppColors.grey10: AppColors.grey0,
                ),
              );
            }),
          ),
          SizedBox(height: 27.h),
          if(_currentSlide==2)
            loginButton()
        ],
      ),
    );
  }


  @override
  Widget loginButton() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.login);
      },
      child: Container(
        width: 300.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.grey10, // Button's background color
        ),
        child: Center(
          child: Text(
            '시작하기',
            style: AppTextStyles.T1Bold16.copyWith(color: AppColors.white),
            textAlign: TextAlign.center, // 중앙 정렬 설정
          ),
          ),
        ),
      );
  }







}
