import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/modules/payment/view/payment_card_info_view.dart';
import 'package:match/modules/payment/widget/select_pay_method_widget.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/components/global_button.dart';
import 'package:match/util/components/global_checkbox.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../util/const/style/global_color.dart';
import '../controller/payment_controller.dart';
import '../widget/payment_widget.dart';

class PaymentSelectCardScreen extends GetView<PaymentController> {
  const PaymentSelectCardScreen({super.key});

  @override
  Widget build(BuildContext context){

    final cardNames = [
      ['토스카드','카카오뱅크','국민카드'],
      ['농협카드','우리카드','현대카드'],
      ['하나카드','신한카드','롯데카드'],
      ['BC카드','삼성카드','K뱅크카드'],
      ['씨티카드','수협카드','우체국카드'],
      ['신협카드','기타'],
    ];
    final cardIcons = [
      ['ic_toss.svg','ic_kakao.svg','ic_kbb.svg'],
      ['ic_nh.svg','ic_woori.svg','ic_hyundai.svg'],
      ['ic_hana.svg','ic_shinhan.svg','ic_lotte.svg'],
      ['ic_bc.svg','ic_samsung.svg','ic_kbank.svg'],
      ['ic_citi.svg','ic_suhyup.svg','ic_postoffice.svg'],
      ['ic_sinhyup.svg','ic_etc.svg',],
    ];


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
                  '등록할 카드 선택하기',
                  style: AppTextStyles.T1Bold18,
                ),
                SizedBox(height: 10.h),
                Divider( // 수평선 추가
                  height: 1, // 선의 높이
                  color: AppColors.grey1, // 선의 색상
                  thickness: 1, // 선의 두께
                ),
                SizedBox(height: 40.h),

                Column(
                  children: [
                    for (var rowIndex = 0; rowIndex < cardIcons.length; rowIndex++) // 각 행에 대한 반복
                      Row(
                        children: [
                          for (var itemIndex = 0; itemIndex < cardIcons[rowIndex].length; itemIndex++) // 각 행에 있는 항목에 대한 반복
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 20.h,
                                right: (itemIndex < cardIcons[rowIndex].length - 1) ? 17.w : 0, // 가장 오른쪽 요소에 대한 마진 제거
                              ),
                              width: 95.w,
                              height: 62.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.grey1,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8), // 모서리의 반경을 설정합니다. 여기서는 각 모서리가 10.0의 반경을 가진다고 가정합니다.
                              ),
                              child: Column( // 카드 아이콘과 이름을 포함하는 새로운 Column
                                children: [
                                  SizedBox(height: 9.h),
                                  SvgPicture.asset(
                                    iconDir + "card/" + cardIcons[rowIndex][itemIndex],
                                    width: 24.w,
                                    height: 24.h,
                                  ),
                                  SizedBox(height: 3.h),
                                  Text(
                                    cardNames[rowIndex][itemIndex],
                                    style: AppTextStyles.T1Bold12.copyWith(color: AppColors.grey8)
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
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
                      Get.to(PaymentCardInfoScreen());
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
