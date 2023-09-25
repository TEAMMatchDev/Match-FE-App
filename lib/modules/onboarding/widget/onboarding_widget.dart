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
    'Description for Item 1',
    'Description for Item 2',
    'Description for Item 3',
  ];

  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    final bool isThirdCarousel = false;

    return Scaffold(
      body: Column(
        children: [
          sliderWidget(images, _currentSlide),
          indicatorWidget(images.length, _currentSlide),
          SizedBox(height: 100.h),
        ],
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
                SizedBox(height: 8.0), // Add spacing
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16.sp,
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
            GestureDetector(
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
                      color: Colors.white, // Text color
                      fontSize: 16.sp, // Text font size
                    ),
                  ),
                ),
              ),
            ),// Add spacing between indicator and button
        ],
      ),
    );
  }



/*@override
  Widget loginButton({
    required VoidCallback onPressed,
    required String label,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.blue, // Background color of the button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white, // Text color
          fontSize: 16.0, // Text font size
        ),
      ),
    );
  }*/



}
