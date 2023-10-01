import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../util/components/global_widget.dart';
import '../../../util/const/global_variable.dart';
import '../../../util/const/style/global_color.dart';
import '../../home/widget/home_widget.dart';
import '../controller/project_controller.dart';

class ProjectScreen extends GetView<ProjectController> {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //1. appbar + 상단 이미지 + 공유버튼
          //appbar 상단 고정의 경우 기획 확인 필요
          Stack(children: [
            Image.network(
              tmpBackgroundImg2,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              top: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(
                          iconDir + "ic_arrow_left_24.svg",
                          color: AppColors.white,
                          width: 24.w,
                        )),
                    LikeIcon(isLike: controller.isLike)
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 24.h,
                right: 20.w,
                child: GestureDetector(
                    onTap: () {
                      //TODO: share 기능 구현/ 저장,복사,공유하기 버튼
                    },
                    child: SvgPicture.asset(
                      iconDir + "ic_share_16.svg",
                      height: 30.h,
                    ))),
          ]),
        ],
      ),
    );
  }
}
