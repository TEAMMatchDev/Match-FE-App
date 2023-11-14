import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../util/components/global_button.dart';

class PaymentExpireScreen extends StatelessWidget {
  const PaymentExpireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "결제 중지 완료!",
                  style: AppTextStyles.T1Bold24,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "마음의 여유가 생기고\n성냥을 켜고 싶을 때, MATCH를 찾아주세요!",
                  textAlign: TextAlign.center,
                  style:
                      AppTextStyles.T1Bold15.copyWith(color: AppColors.grey7),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 29.w,
            ).copyWith(bottom: 24.h),
            child: CommonButton.payment(
                verticalPadding: 13,
                isActive: true,
                text: "확인",
                onTap: (() async {
                  Get.back();
                  Get.back();
                })),
          )
        ],
      ),
    );
  }
}
