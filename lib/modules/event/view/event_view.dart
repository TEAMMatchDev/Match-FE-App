import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/modules/event/widget/event_widget.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../provider/api/util/global_api_field.dart';
import '../../../util/components/global_widget.dart';
import '../../../util/const/style/global_logger.dart';
import '../../../util/const/style/global_skeleton.dart';
import '../controller/event_controller.dart';

class EventScreen extends GetView<EventController> {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
      children: [
          //*1.제목 header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h)
                .copyWith(bottom: 17.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "이벤트",
                  style: AppTextStyles.T1Bold16,
                  textAlign: TextAlign.center,
                ),
                alarmButton()
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h)
                  .copyWith(bottom: 17.h),
              width: double.infinity,
              height: double.infinity,
              child: Obx(
                ()=>controller.eventList.isEmpty?CommonSkeleton.event():
                    CarouselSlider.builder(
                  itemCount: controller.eventList.length,
                  itemBuilder: (context, index, realIndex) {
                    if (index % (PAGINATION_SIZE - 1) == 0 &&
                        index != 0) {
                      logger.d("1. getMore 호출!");
                      Future.wait({
                        controller.getMoreNotice(
                            index: index ~/ (PAGINATION_SIZE - 1))
                      });
                    }
                    return EventWidget(event: controller.eventList[index]);
                  },
                  options: CarouselOptions(
                      autoPlay: false,
                      aspectRatio: 299.w / 445.h,
                      viewportFraction: 1,
                      scrollDirection: Axis.vertical),
                ),
              ),
            ),
          ),
      ],
    ),
        ));
  }
}
