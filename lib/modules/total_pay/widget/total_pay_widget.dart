import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../provider/routes/routes.dart';
import '../../../util/components/global_button.dart';
import '../../../util/components/global_modal.dart';
import '../../../util/components/global_widget.dart';
import '../../../util/const/global_variable.dart';
import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';

///<h2>불타는 진행중인 매치 목록 item </h2>
///*[PaymentScreen]]에서 사용되는 위젯<br/>
///* 5-8 api 사용
class MatchPayItem extends StatelessWidget {
  final String title;
  final String date;
  final String type;
  final String regular;
  final int regularPayId;
  const MatchPayItem(
      {super.key,
      required this.title,
      required this.date,
      required this.type,
      required this.regularPayId,
      required this.regular});

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
          regular: regular,
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
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CommonDialog.payDelete(
                          context: context,
                        );
                      },
                    );
                  }),
            ),
          ],
        )
      ],
    );
  }
}

///<h2>결제내역을 그리는 레이아웃 위젯</h2>
///*5-5 api
///*[PaymentScreen]에서 사용되는 위젯<br/>
class MatchPayment extends StatelessWidget {
  final String regular;
  const MatchPayment({
    super.key,
    required this.regular,
  });

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
          height: 7.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("후원 금액",
                style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey6)),
            SizedBox(
              width: 15.w,
            ),
            Text(regular,
                style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey7)),
          ],
        ),
      ],
    );
  }
}
