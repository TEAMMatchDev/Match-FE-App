import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile_nic/timeline_tile.dart';

import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';
import '../../home/widget/home_widget.dart';

class MatchRecord extends StatelessWidget {
  final bool isFinal;
  final String title;
  final String date;
  final List<String> imgList;
  const MatchRecord(
      {super.key,
      this.isFinal = false,
      required this.title,
      required this.date,
      required this.imgList});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
        alignment: TimelineAlign.start,
        lineXY: 0.1,
        isFirst: true,
        endChild: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTextStyles.subtitle3Bold13,
                ),
                Text(
                  date,
                  style: AppTextStyles.body3Bold12.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.grey6),
                ),
                Wrap(
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
        ),
        indicatorStyle: IndicatorStyle(
            width: 14.w,
            height: 14.h,
            indicatorXY: 0.1,
            indicator: Container(
              height: 14.h,
              width: 14.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.primary500),
            )));
    ;
  }
}
