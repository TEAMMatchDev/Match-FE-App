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
    '$imgDir'+'onboarding/iv_onboarding_1.png',
    '$imgDir'+'onboarding/iv_onboarding_2.png',
    '$imgDir'+'onboarding/iv_onboarding_3.png',
  ];
  final List<String> titles = ['Title 1', 'Title 2', 'Title 3'];
  final List<String> descriptions = [
    'MATCH를 통해 기부된\n여러분의 마음은 불꽃이가 돼요.',
    '불꽃이는 선택한 기부처에 따라\n필요한 쓰임으로 변신합니다.',
    'MATCH에서 후원금이\n어떻게 관리되고 있는지 알아보세요.',
  ];

  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10.h),
          skipWidget(), //상단 건너뛰기 버튼
          sliderWidget(images, _currentSlide), //온보딩 이미지
          SizedBox(height: 90.h),
          indicatorWidget(images.length, _currentSlide), //인디케이터
          SizedBox(height: 100.h),
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
          final String description = descriptions[index]; // Get the description for the current image

          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    image,
                    width: 180.w,
                    height: 180.h,
                  ),
                ),
                SizedBox(height: 28.h), // Add spacing
                Container(
                  width: 230.w,
                  height: 48.h,
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
