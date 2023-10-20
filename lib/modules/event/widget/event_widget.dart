import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../provider/routes/routes.dart';
import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';
import '../../home/widget/home_widget.dart';

class EventWidget extends StatelessWidget {
  final int eventId;

  const EventWidget({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.event_detail, arguments: {"event_id": eventId});
      },
      child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(tmpBackgroundImg2),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 18.w,
                bottom: 22.h,
                child: IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "이벤트 제목",
                        style: AppTextStyles.T1Bold14.copyWith(
                            color: AppColors.black),
                      ),
                      SizedBox(height: 11.h),
                      Text(
                        "이벤트 소제목",
                        style: AppTextStyles.T1Bold12.copyWith(
                            color: Color(0xFF3B3B3B)),
                      ),
                      SizedBox(height: 11.h),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.grey2,
                          ),
                          child: Text(
                            "진행중 YY.MM.DD - YY.MM.DD ",
                            style: AppTextStyles.T1Bold10.copyWith(
                                color: Color(0xFF3B3B3B)),
                          )),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
