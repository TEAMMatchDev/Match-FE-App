import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile_nic/timeline_tile.dart';

import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';
import '../../home/widget/home_widget.dart';

class MatchRecord extends StatelessWidget {
  final String title;
  final String date;
  final List<String> imgList;
  final bool isChange;
  const MatchRecord(
      {super.key,
      required this.title,
      required this.date,
      required this.imgList,
      this.isChange = false});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.start,
      lineXY: 0.0,
      isFirst: true,
      indicatorStyle: IndicatorStyle(
        indicator: Container(
          margin: EdgeInsets.symmetric(vertical: 5.h),
          height: isChange ? 8.h : 14.h,
          width: isChange ? 8.h : 14.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isChange ? AppColors.grey5 : AppColors.primary500),
        ),
      ),
      beforeLineStyle: LineStyle(color: AppColors.grey1, thickness: 2.w),
      // endChild: Padding(
      // padding: EdgeInsets.only(left: 8.w, bottom: 30.h),
      endChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppTextStyles.subtitle3Bold13,
            ),
            SizedBox(
              height: 6.h,
            ),
            Text(
              date,
              style: AppTextStyles.body3Bold12.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.grey6),
            ),
            SizedBox(
              height: 10.h,
            ),
            Wrap(
                direction: Axis.horizontal,
                spacing: 10.w,
                children: imgList
                    .map((e) => Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(tmpBackgroundImg),
                          ),
                        )))
                    .toList())
          ]),
      // ),
    );
  }
}
