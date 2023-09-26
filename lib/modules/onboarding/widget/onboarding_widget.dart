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
    '$imgDir'+'logo/iv_home_logo.png',
    '$imgDir'+'logo/iv_home_logo.png',
    '$imgDir'+'logo/iv_home_logo.png',
  ];
  final List<String> titles = ['Title 1', 'Title 2', 'Title 3'];
  final List<String> descriptions = [
    'MATCH에서 후원으로\n꿈꾸고 있던 세상을 만들어 보세요.',
    'MATCH에서\n특별한 후원 경험을 만나보세요.',
    'MATCH에서 후원금이\n어떻게 관리되고 있는지 알아보세요.',
  ];

  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          skipWidget(),
          sliderWidget(images, _currentSlide),
          indicatorWidget(images.length, _currentSlide),
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
          style: TextStyle(
            color: AppColors.grey6, // 색상 설정
            fontSize: 13.sp, // 폰트 크기 설정
            fontWeight: FontWeight.w500, // 폰트 굵기 설정
            decoration: TextDecoration.underline, // 밑줄 설정
            fontFamily: 'Apple SD Gothic Neo', // 폰트 설정
          ),
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
                  width: 225.w, // Set your desired width
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                    textAlign: TextAlign.center, // 중앙 정렬 설정
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        options: CarouselOptions(
          aspectRatio: 16 / 9,
          autoPlay: true,
          viewportFraction: 320 / 300,
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
          borderRadius: BorderRadius.circular(10.0), // Set border radius to 10px
          color: AppColors.grey10, // Button's background color
        ),
        child: Center(
          child: Text(
            '시작하기',
            style: TextStyle(
              color: AppColors.white, // 색상 설정
              fontSize: 16.sp, // 폰트 크기 설정
              fontWeight: FontWeight.w700, // 폰트 굵기 설정
              fontFamily: 'Apple SD Gothic Neo', // 폰트 설정
            ),
            textAlign: TextAlign.center, // 중앙 정렬 설정
          ),
          ),
        ),
      );
  }







}
