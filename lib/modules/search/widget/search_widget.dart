//일회성으로 사용되는 위젯들이므로 변수형으로 선언
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:match/modules/home/widget/home_widget.dart';
import 'package:match/util/const/global_variable.dart';

import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';

Widget RecentItem({required String name, required String title}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        name,
        style:
            AppTextStyles.subtitle3Bold13.copyWith(fontWeight: FontWeight.w600),
      ),
      Text(
        title,
        style: AppTextStyles.body3Bold12
            .copyWith(fontWeight: FontWeight.w500, color: AppColors.grey6),
      ),
    ],
  );
}

///* 검색 결과 ListTile Item
Widget SearchItem(
    {String imgUrl = tmpBackgroundImg,
    required String name,
    required String title}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 43.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(imgUrl),
          ),
        ),
      ),
      SizedBox(
        width: 12.w,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.body3Bold12.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.grey6),
            ),
            SizedBox(
              height: 6.h,
            ),
            Text(
              name,
              style: AppTextStyles.subtitle3Bold13
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      SvgPicture.asset(iconDir + "ic_search_arrow_40.svg")
    ],
  );
}
