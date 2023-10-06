//일회성으로 사용되는 위젯들이므로 변수형으로 선언
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:match/model/recent_search/recent_search.dart';
import 'package:match/modules/home/widget/home_widget.dart';
import 'package:match/util/const/global_variable.dart';

import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';

Widget RecentItem(
    {required RecentSearch recentSearch,
    required Future<void> Function() onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 120.w,
          child: Text(
            recentSearch.name,
            style: AppTextStyles.T1Bold13.copyWith(fontWeight: FontWeight.w600),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          recentSearch.title,
          style: AppTextStyles.T1Bold12.copyWith(
              fontWeight: FontWeight.w500, color: AppColors.grey6),
        ),
      ],
    ),
  );
}

///* 검색 결과 ListTile Item
Widget SearchItem(
    {required String imgUrl,
    required String name,
    required String title,
    required int projectId}) {
  return GestureDetector(
    onTap: () {
      //TODO: projectID로 후원 상세페이지 이동
      //research.projectId
    },
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 43.h,
          width: 43.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Image.network(imgUrl),
        ),
        SizedBox(
          width: 12.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                //고유이름
                name,
                style: AppTextStyles.T1Bold13.copyWith(
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                //후원타이틀
                title,
                style: AppTextStyles.T1Bold12.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.grey6),
              ),
            ],
          ),
        ),
        SvgPicture.asset(iconDir + "ic_search_arrow_40.svg")
      ],
    ),
  );
}
