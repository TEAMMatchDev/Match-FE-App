import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/modules/payment/widget/select_pay_method_widget.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/components/global_button.dart';
import 'package:match/util/components/global_checkbox.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../util/const/style/global_color.dart';
import '../controller/payment_controller.dart';
import '../widget/payment_widget.dart';

class PaymentMethodScreen extends GetView<PaymentController> {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context){
    List<String> payAgreeStringList = [
      '결제대행 서비스 이용약관 동의',
      '개인 정보 제 3자 정보 제공 동의',
    ];
    String title = '결제 내용에 모두 동의합니다.';


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
                Text(
                  '기부금 결제하기',
                  style: AppTextStyles.T1Bold18,
                ),
                SizedBox(height: 23.h),
                SvgPicture.asset(
                  iconDir + "payment/ic_rating_stick_3.svg",
                  width: 330.w,
                ),
                SizedBox(height: 30.h),
                Text(
                    '3. 결제 수단을 선택해주세요.',
                    style: AppTextStyles.T1Bold15.copyWith(color: AppColors.grey9)
                ),
                SizedBox(height: 20.h),
                Divider( // 수평선 추가
                  height: 1, // 선의 높이
                  color: AppColors.grey1, // 선의 색상
                  thickness: 1, // 선의 두께
                ),
                SizedBox(height: 20.h),
                Text(
                    '기부 금액',
                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9)
                ),
                SizedBox(height: 10.h),
                Text(
                    '매월 • 1일 • N,000원',
                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey8)
                ),
                SizedBox(height: 30.h),
                Text(
                    '기부  수단',
                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9)
                ),
                SizedBox(height: 16.h),

                PayMethodRadioButtons(),

                SizedBox(height: 23.h),
                Divider( // 수평선 추가
                  height: 1, // 선의 높이
                  color: AppColors.grey1, // 선의 색상
                  thickness: 1, // 선의 두께
                ),
                SizedBox(height: 30.h),
                Text(
                    '결제 내용 확인 및 동의',
                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9)
                ),
                SizedBox(height: 16.h),

                CheckBoxExample(stringList: payAgreeStringList, title: title),



                SizedBox(height: 60.h),


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
