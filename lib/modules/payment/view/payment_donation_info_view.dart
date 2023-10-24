import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/modules/payment/view/payment_method_info_view.dart';
import 'package:match/modules/payment/widget/select_amount_widget.dart';
import 'package:match/modules/payment/widget/select_paydate_widget.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/components/global_button.dart';
import 'package:match/util/components/global_number_field.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../util/const/style/global_color.dart';
import '../controller/payment_controller.dart';
import '../widget/payment_widget.dart';

class PaymentDonationScreen extends GetView<PaymentController> {
  const PaymentDonationScreen({super.key});

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h)
                  .copyWith(bottom: 0.h),
              child: Column(
                children: [
                  // *1.제목 header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        imgDir + "logo/iv_home_logo.png",
                        width: 75.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  Text(
                    '기부금 결제하기',
                    style: AppTextStyles.T1Bold18,
                  ),
                  SizedBox(height: 23.h),
                  SvgPicture.asset(
                    iconDir + "payment/ic_rating_stick_2.svg",
                    width: 330.w,
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    '2. 결제 방식을 선택해주세요.',
                    style: AppTextStyles.T1Bold15.copyWith(color: AppColors.grey9),
                  ),
                  SizedBox(height: 20.h),
                  Divider(
                    height: 1,
                    color: AppColors.grey1,
                    thickness: 1,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    '기부처',
                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    width: 360.w,
                    decoration: BoxDecoration(
                      color: AppColors.grey11,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      '기부처명',
                      style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey7),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    '기부 금액',
                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9),
                  ),
                  SizedBox(height: 16.h),
                  SelectAmountRadioButtons(),
                  SizedBox(height: 30.h),
                  Text(
                    '기부 결제일',
                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9),
                  ),
                  SizedBox(height: 16.h),
                  PayDateButtonRadioButtons(),
                  SizedBox(height: 56.h),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 6),
                    child: CommonButton.back(
                      text: "이전 돌아가기",
                      onTap: () async {
                        Get.back();
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 6.w, right: 20),
                    child: CommonButton.login(
                      text: "확인",
                      onTap: () async {
                        Get.to(PaymentMethodScreen());
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
