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
          child: Obx(
            () => ListView(
              physics: ScrollPhysics(),
              children: [
                SizedBox(
                  height: 33.h,
                ),
                Text(
                  controller.eventDetail.value.eventInfo.smallTitle,
                  style: AppTextStyles.L1Medium13.copyWith(),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  controller.eventDetail.value.eventInfo.title,
                  style: AppTextStyles.T1Bold15,
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  "${controller.eventDetail.value.eventInfo.startDate} ~ ${controller.eventDetail.value.eventInfo.endDate}",
                  style: AppTextStyles.S1SemiBold13.copyWith(
                    color: AppColors.grey3,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: const Divider(
                    thickness: 1,
                    color: AppColors.divider1,
                  ),
                ),
                ...controller.eventDetail.value.eventContents.map((content) {
                  return content.contentsType == "IMG"
                      ? Image.network(
                          content.contents,
                          width: double.infinity,
                        )
                      : Text(
                          content.contents,
                          style: AppTextStyles.S1SemiBold14,
                        );
                }).toList(),

                // Container(
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10.r),
                //   ),
                //   child: Image.network(tmpBackgroundImg2),
                // ),
                // SizedBox(
                //   height: 23.h,
                // ),
                // Text(
                //   "매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다.매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다.매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다.매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다.매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다. 매칭 정보에 대한 텍스트를 입력합니다.",
                //   style: AppTextStyles.S1SemiBold14.copyWith(
                //     color: AppColors.grey7,
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }
}
