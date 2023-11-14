import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../util/const/global_mock_data.dart';
import '../../../util/const/global_variable.dart';

class PictureDetailScreen extends StatelessWidget {
  final List<String> pictureList;

  const PictureDetailScreen(
      {super.key,
      this.pictureList = const [
        tmpBackgroundImg,
        tmpBackgroundImg,
        tmpBackgroundImg,
        tmpBackgroundImg
      ]});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: PageView.builder(
          itemCount: pictureList.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 27.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 24.w,),
                      Text(
                        "${index+1}/${pictureList.length}",
                        textAlign: TextAlign.center,
                        style:
                            AppTextStyles.T1Bold15.copyWith(color: AppColors.white),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: SvgPicture.asset(
                          iconDir + "ic_close_24.svg",
                          color: AppColors.white,
                          width: 24.w,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      width: 360.w,
                      height: 360.w,
                      child: Image.network(pictureList[index]),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
