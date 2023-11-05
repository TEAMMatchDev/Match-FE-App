import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/modules/buring_match/view/match_picture_detail_view.dart';
import 'package:timeline_tile_nic/timeline_tile.dart';
import '../../../util/const/global_mock_data.dart';
import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';

///<h2> 불꽃이 상세의 하단 정보를 표시하는 위젯 </h2>
/// Timeline 라이브러리를 활용하여 구현
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
        padding: EdgeInsets.symmetric(vertical: 20.h)
            .copyWith(left: isChange ? 3.w : 0),
        // historyStatus == CHANGE 일 경우에 회색 색상의 indicator로 변경
        color: isChange ? AppColors.grey5 : AppColors.primary500,
        height: isChange ? 8.w : 14.w,
        width: isChange ? 8.w : 14.w,
      ),
      beforeLineStyle: LineStyle(color: AppColors.grey1, thickness: 2.w),
      endChild: IntrinsicHeight(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  title,
                  style: AppTextStyles.T1Bold13,
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  date,
                  style: AppTextStyles.T1Bold12.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.grey6),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () async {
                    //사진 클릭시 상세 화면으로 이동
                    await Get.to(() => const PictureDetailScreen());
                  },
                  child: Wrap(
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
                          .toList()),
                )
              ]),
        ),
      ),
      // ),
    );
  }
}
