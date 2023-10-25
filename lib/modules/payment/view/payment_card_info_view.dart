import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/model/enum/search_statu.dart';
import 'package:match/modules/payment/widget/select_card_widget.dart';
import 'package:match/modules/payment/widget/select_pay_method_widget.dart';
import 'package:match/util/components/gloabl_text_field.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/components/global_button.dart';
import 'package:match/util/components/global_checkbox.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../util/const/style/global_color.dart';
import '../controller/payment_controller.dart';
import '../widget/payment_widget.dart';

class PaymentCardInfoScreen extends GetView<PaymentController> {
  const PaymentCardInfoScreen({super.key});

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
                  //*1.제목 header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        imgDir + "logo/iv_home_logo.png",
                        width: 75.w,
                      ),
                    ],
                  ),
                ]
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Text(
                      '카드 정보 입력 ',
                      style: AppTextStyles.T1Bold18,
                    ),
                    Text(
                      '(최초 1회만 등록)',
                      style: AppTextStyles.T1Bold18.copyWith(color: AppColors.grey3),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Divider( // 수평선 추가
                  height: 1, // 선의 높이
                  color: AppColors.grey1, // 선의 색상
                  thickness: 1, // 선의 두께
                ),
                SizedBox(height: 40.h),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '카드번호',
                        style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9)
                    ),
                    SizedBox(height: 12.h),
                    CardNumberInputField(),

                    SizedBox(height: 37.h),

                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '유효기간',
                                style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9)
                            ),
                            SizedBox(height: 14.h),
                            //CardNumberInputField(),
                          ],
                        ),
                        SizedBox(width: 15.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                    'CVC  ',
                                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9)
                                ),
                                Text(
                                    '(카드 뒷면 숫자 3자리)',
                                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey3)
                                ),
                              ],
                            ),
                            SizedBox(height: 14.h),
                            //CardNumberInputField(),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 37.h),

                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                    '생년월일  ',
                                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9)
                                ),
                                Text(
                                    '(6자리)',
                                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey3)
                                ),
                              ],
                            ),
                            SizedBox(height: 14.h),
                            //CardNumberInputField(),
                          ],
                        ),
                        SizedBox(width: 15.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                    '카드 비밀번호  ',
                                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9)
                                ),
                                Text(
                                    '(앞 2자리)',
                                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey3)
                                ),
                              ],
                            ),
                            SizedBox(height: 14.h),
                            //CardNumberInputField(),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 180.h),




                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
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
                    text: "다음",
                    onTap: () async {
                      Get.back();
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
