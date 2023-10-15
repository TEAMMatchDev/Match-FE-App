import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../provider/routes/routes.dart';
import '../../../util/components/global_button.dart';
import '../../../util/components/global_widget.dart';
import '../../../util/const/global_variable.dart';
import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';

///<h2>불타는 진행중인 매치 목록 item </h2>
///*[PaymentScreen]]에서 사용되는 위젯<br/>
///* 5-8 api 사용
class MatchCredit extends StatelessWidget {
  final String title;
  final String date;
  final String type;
  final int day;
  final int price;
  const MatchCredit(
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
                Text(title, style: AppTextStyles.T1Bold18),
                SizedBox(
                  height: 7.h,
                ),
                Text(date,
                    style: AppTextStyles.T1Bold14.copyWith(
                        color: AppColors.grey6)),
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
        MatchPayment(
          day: day,
          price: price,
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            Expanded(
              child: CommonButton(
                text: "상세정보",
                onTap: () async {
                  Get.toNamed(Routes.pay);
                },
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              child: CommonButton(
                text: "해지하기",
                onTap: () async {
                  //TODO: 해지 dialog 로직 추가
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}

///<h2>결제내역을 그리는 레이아웃 위젯</h2>
///*[PaymentScreen]에서 사용되는 위젯<br/>
class MatchPayment extends StatelessWidget {
  final int day;
  final int price;
  const MatchPayment({super.key, required this.day, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("매치 결제 정보", style: AppTextStyles.T1Bold15),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("후원 금액",
                style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey6)),
            SizedBox(
              width: 15.w,
            ),
            Text("매월 • ${day}일 • ${price}원",
                style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey7)),
          ],
        ),
      ],
    );
  }
}
