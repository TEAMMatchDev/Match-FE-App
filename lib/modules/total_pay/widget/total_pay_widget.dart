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

///<h2>매치 결제 목록 item </h2>
///*[TotalPayScreen]에서 사용되는 위젯<br/>
///* 5-11 api 사용
class MatchPayItem extends StatelessWidget {
  final String title;
  final String date;
  final String type;
  final String regularInfo;
  final int regularPayId;

  const MatchPayItem(
      {super.key,
      required this.title,
      required this.date,
      required this.type,
      required this.regularPayId,
      required this.regularInfo});

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
          child: const Divider(
            thickness: 1,
            color: AppColors.divider1,
          ),
        ),
        MatchPayment(
          regularInfo: regularInfo,
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            Expanded(
              child: CommonButton(
                verticalPadding: 14,
                text: "상세정보",
                onTap: () async {
                  Get.toNamed(Routes.pay,
                      arguments: {"regularPayId": regularPayId});
                },
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              child: type == "정기 후원"
                  ? CommonButton(
                      verticalPadding: 14,
                      text: "해지하기",
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CommonDialog.payDelete(
                              context: context,
                              regularId: regularPayId,
                            );
                          },
                        );
                      })
                  : Container(),
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
  final String regularInfo;

  const MatchPayment({
    super.key,
    required this.regularInfo,
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
            Text("기부 금액",
                style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey6)),
            SizedBox(
              width: 15.w,
            ),
            Text(regularInfo,
                style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey7)),
          ],
        ),
      ],
    );
  }
}
