import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/modules/event_detail/controller/event_detail_controller.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../home/widget/home_widget.dart';

class EventDetailScreen extends GetView<EventDetailController> {
  const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar.basic("매치 이벤트"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            physics: ScrollPhysics(),
            children: [
              SizedBox(
                height: 33.h,
              ),
              Text(
                "이벤트 소제목",
                style: AppTextStyles.L1Medium13.copyWith(),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "이벤트 제목",
                style: AppTextStyles.T1Bold15,
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                "2023.04.12 ~ 2023.04.13",
                style: AppTextStyles.S1SemiBold13.copyWith(
                  color: AppColors.grey3,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: Divider(
                  thickness: 1,
                  color: AppColors.divider1,
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Image.network(tmpBackgroundImg2),
              ),
              SizedBox(
                height: 23.h,
              ),
              Text(
                "매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다.매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다.매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다.매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다.매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다.",
                style: AppTextStyles.S1SemiBold14.copyWith(
                  color: AppColors.grey7,
                ),
              ),
            ],
          ),
        ));
  }
}
