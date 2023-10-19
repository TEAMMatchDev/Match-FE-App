import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match/model/pay/pay.dart';
import 'package:match/util/components/global_widget.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

class PaymentListTile extends StatelessWidget {
  final Pay pay;
  const PaymentListTile({super.key, required this.pay});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              pay.payDate,
              style: AppTextStyles.T1Bold16,
            ),
            SizedBox(
              width: 13.w,
            ),
            TypeChip(type: pay.payStatus)
          ],
        ),
        SizedBox(
          height: 17.h,
        ),
        PaymentDetail(title: "결제 방법", content: pay.payMethod),
        SizedBox(
          height: 10.h,
        ),
        PaymentDetail(title: "결제 금액", content: pay.amount),
      ],
    );
  }

  Widget PaymentDetail({required String title, required String content}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.L1Medium13.copyWith(
            color: AppColors.grey8,
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        Text(content, style: AppTextStyles.T1Bold13),
      ],
    );
  }
}
