import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:match/util/components/global_widget.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../util/components/global_button.dart';
import '../../../util/const/style/global_color.dart';

///<h2>불타는 진행중인 매치 목록 item </h2>
///[BurningMatchPayScreen]에서 사용되는 위젯<br/>
///* 5-8 api 사용
class BurningMatchCredit extends StatelessWidget {
  final String title;
  final String date;
  final String type;
  final int day;
  final int price;
  const BurningMatchCredit(
      {super.key,
      required this.title,
      required this.date,
      required this.type,
      required this.day,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.heading2Bold18),
                SizedBox(
                  height: 7.h,
                ),
                Text(date,
                    style: AppTextStyles.subtitle2Bold14
                        .copyWith(color: AppColors.grey6)),
              ],
            ),
            TypeChip(type: type)
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: Divider(
            thickness: 1,
            color: AppColors.divider1,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("매치 결제 정보", style: AppTextStyles.subtitle1Bold15),
            Row(
              children: [
                Text("결제 내역",
                    style: AppTextStyles.subtitle2Bold14
                        .copyWith(color: AppColors.grey6)),
                SvgPicture.asset(iconDir + "ic_arrow_right_22.svg"),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("후원 금액",
                style: AppTextStyles.subtitle2Bold14
                    .copyWith(color: AppColors.grey6)),
            SizedBox(
              width: 15.w,
            ),
            Text("매월 • ${day}일 ${price}원",
                style: AppTextStyles.subtitle2Bold14
                    .copyWith(color: AppColors.grey7)),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            Expanded(
              child: CommonButton(
                text: "매치 기록",
                onTap: () async {
                  //TODO: 매치 기록 페이지로 이동
                },
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              child: CommonButton(
                text: "매치 해지",
                onTap: () async {
                  //TODO: 매치 해지 로직 추가
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
